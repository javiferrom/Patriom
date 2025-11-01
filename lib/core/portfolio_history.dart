import 'package:json_annotation/json_annotation.dart';

part 'portfolio_history.g.dart';

@JsonSerializable(explicitToJson: true)
class PortfolioHistory {
  final List<HistoryEntry> history;

  PortfolioHistory({required this.history});

  factory PortfolioHistory.fromJson(Map<String, dynamic> json) =>
      _$PortfolioHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioHistoryToJson(this);

  factory PortfolioHistory.empty() =>
      PortfolioHistory(history: [HistoryEntry(date: '', assets: [], liabilities: [])]);

  HistoryEntry? entryByDate(String date) =>
      history.where((e) => e.date == date).cast<HistoryEntry?>().firstWhere((e) => e != null, orElse: () => null);

  PortfolioHistory upsertEntry(HistoryEntry entry) {
    final list = List<HistoryEntry>.from(history);
    final i = list.indexWhere((e) => e.date == entry.date);
    if (i >= 0) {
      list[i] = entry;
    } else {
      list.add(entry);
    }
    return PortfolioHistory(history: list);
  }
}

@JsonSerializable(explicitToJson: true)
class HistoryEntry {
  final String date;
  final List<FinancialItem> assets;
  final List<FinancialItem> liabilities;

  HistoryEntry({required this.date, required this.assets, required this.liabilities});

  factory HistoryEntry.fromJson(Map<String, dynamic> json) => _$HistoryEntryFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryEntryToJson(this);

  HistoryEntry addAsset(FinancialItem item) =>
      HistoryEntry(date: date, assets: [...assets, item], liabilities: liabilities);

  HistoryEntry addLiability(FinancialItem item) =>
      HistoryEntry(date: date, assets: assets, liabilities: [...liabilities, item]);

  HistoryEntry replaceItem(String id, FinancialItem newItem) {
    final a = assets.map((x) => x.id == id ? newItem : x).toList();
    final l = liabilities.map((x) => x.id == id ? newItem : x).toList();
    return HistoryEntry(date: date, assets: a, liabilities: l);
  }

  HistoryEntry removeItem(String id) =>
      HistoryEntry(date: date, assets: assets.where((x) => x.id != id).toList(), liabilities: liabilities.where((x) => x.id != id).toList());
}

@JsonSerializable()
class FinancialItem {
  final String id;
  final bool active;
  final bool current;
  final String entity;
  final double amount;
  final String currency;
  final String description;

  FinancialItem({
    required this.id,
    required this.active,
    required this.current,
    required this.entity,
    required this.amount,
    required this.currency,
    required this.description,
  });

  factory FinancialItem.fromJson(Map<String, dynamic> json) => _$FinancialItemFromJson(json);
  Map<String, dynamic> toJson() => _$FinancialItemToJson(this);

  FinancialItem copyWith({
    String? id,
    bool? active,
    bool? current,
    String? entity,
    double? amount,
    String? currency,
    String? description,
  }) {
    return FinancialItem(
      id: id ?? this.id,
      active: active ?? this.active,
      current: current ?? this.current,
      entity: entity ?? this.entity,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      description: description ?? this.description,
    );
  }
}