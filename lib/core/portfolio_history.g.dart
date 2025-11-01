// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioHistory _$PortfolioHistoryFromJson(Map<String, dynamic> json) =>
    PortfolioHistory(
      history: (json['history'] as List<dynamic>)
          .map((e) => HistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PortfolioHistoryToJson(PortfolioHistory instance) =>
    <String, dynamic>{
      'history': instance.history.map((e) => e.toJson()).toList(),
    };

HistoryEntry _$HistoryEntryFromJson(Map<String, dynamic> json) => HistoryEntry(
  date: json['date'] as String,
  assets: (json['assets'] as List<dynamic>)
      .map((e) => FinancialItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  liabilities: (json['liabilities'] as List<dynamic>)
      .map((e) => FinancialItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HistoryEntryToJson(HistoryEntry instance) =>
    <String, dynamic>{
      'date': instance.date,
      'assets': instance.assets.map((e) => e.toJson()).toList(),
      'liabilities': instance.liabilities.map((e) => e.toJson()).toList(),
    };

FinancialItem _$FinancialItemFromJson(Map<String, dynamic> json) =>
    FinancialItem(
      id: json['id'] as String,
      active: json['active'] as bool,
      current: json['current'] as bool,
      entity: json['entity'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$FinancialItemToJson(FinancialItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'current': instance.current,
      'entity': instance.entity,
      'amount': instance.amount,
      'currency': instance.currency,
      'description': instance.description,
    };
