import 'dart:convert';
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:patriom/core/portfolio_history.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

class PortfolioHistoryStorage {
  static const _prefsKey = 'portfolio_history_json';
  static const _pretty = JsonEncoder.withIndent('  ');

  static Future<PortfolioHistory> loadOrCreate() async {
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getString(_prefsKey);
    if (existing != null && existing.trim().isNotEmpty) {
      return PortfolioHistory.fromJson(json.decode(existing));
    }
    final empty = PortfolioHistory.empty();
    await prefs.setString(_prefsKey, _pretty.convert(empty.toJson()));
    return empty;
  }

  static Future<PortfolioHistory> getModel() async {
    final prefs = await SharedPreferences.getInstance();
    final content = prefs.getString(_prefsKey);
    if (content == null || content.trim().isEmpty) return loadOrCreate();
    try {
      return PortfolioHistory.fromJson(json.decode(content));
    } catch (_) {
      final empty = PortfolioHistory.empty();
      await overwriteModel(empty);
      return empty;
    }
  }

  static Future<void> overwriteModel(PortfolioHistory data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, _pretty.convert(data.toJson()));
  }

  static Future<void> resetToEmpty() async => overwriteModel(PortfolioHistory.empty());

  static Future<void> importAndOverwrite(String rawJson) async {
    final decoded = json.decode(rawJson);
    final model = PortfolioHistory.fromJson(decoded as Map<String, dynamic>);
    await overwriteModel(model);
  }

  static Future<void> export({String fileName = 'portfolio_history.json'}) async {
    final model = await getModel();
    final content = _pretty.convert(model.toJson());
    if (kIsWeb) {
      await SharePlus.instance.share(ShareParams(text: content, subject: fileName));
      return;
    }
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$fileName');
    await file.writeAsString(content);
    await SharePlus.instance.share(
      ShareParams(files: [XFile(file.path)], text: 'Exported $fileName', subject: fileName),
    );
  }

  static Future<void> pickAndImport({bool overwriteExisting = true}) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['json'], withData: true);
    if (result == null || result.files.isEmpty) return;
    final picked = result.files.first;
    String content;
    if (kIsWeb || picked.bytes != null) {
      content = utf8.decode(picked.bytes!);
    } else {
      final path = picked.path;
      if (path == null) return;
      content = await File(path).readAsString();
    }
    if (overwriteExisting) {
      await importAndOverwrite(content);
    } else {
      final current = await getModel();
      final imported = PortfolioHistory.fromJson(json.decode(content));
      final merged = PortfolioHistory(
        history: [
          ...current.history.where((c) => imported.history.indexWhere((i) => i.date == c.date) < 0),
          ...imported.history,
        ],
      );
      await overwriteModel(merged);
    }
  }

  static Future<void> upsertEntry(HistoryEntry entry) async {
    final model = await getModel();
    final updated = model.upsertEntry(entry);
    await overwriteModel(updated);
  }

  static Future<void> addEntryIfMissing(String date) async {
    final model = await getModel();
    if (model.entryByDate(date) != null) return;
    await upsertEntry(HistoryEntry(date: date, assets: [], liabilities: []));
  }

  static Future<void> addAsset(String date, FinancialItem item) async {
    final model = await getModel();
    final existing = model.entryByDate(date) ?? HistoryEntry(date: date, assets: [], liabilities: []);
    final updatedEntry = existing.addAsset(item);
    await upsertEntry(updatedEntry);
  }

  static Future<void> addLiability(String date, FinancialItem item) async {
    final model = await getModel();
    final existing = model.entryByDate(date) ?? HistoryEntry(date: date, assets: [], liabilities: []);
    final updatedEntry = existing.addLiability(item);
    await upsertEntry(updatedEntry);
  }

  static Future<void> replaceItem(String date, String id, FinancialItem newItem) async {
    final model = await getModel();
    final entry = model.entryByDate(date);
    if (entry == null) return;
    final updatedEntry = entry.replaceItem(id, newItem);
    await upsertEntry(updatedEntry);
  }

  static Future<void> removeItem(String date, String id) async {
    final model = await getModel();
    final entry = model.entryByDate(date);
    if (entry == null) return;
    final updatedEntry = entry.removeItem(id);
    await upsertEntry(updatedEntry);
  }

  static Future<void> setItemAmount(String date, String id, double amount) async {
    final model = await getModel();
    final entry = model.entryByDate(date);
    if (entry == null) return;
    final assetIdx = entry.assets.indexWhere((x) => x.id == id);
    final liabIdx = entry.liabilities.indexWhere((x) => x.id == id);
    if (assetIdx >= 0) {
      final item = entry.assets[assetIdx].copyWith(amount: amount);
      await replaceItem(date, id, item);
    } else if (liabIdx >= 0) {
      final item = entry.liabilities[liabIdx].copyWith(amount: amount);
      await replaceItem(date, id, item);
    }
  }

  static Future<String> getJsonString() async {
    final model = await getModel();
    return _pretty.convert(model.toJson());
  }

  static List<String> _sortedDatesDesc(PortfolioHistory m) {
    final dates = m.history.map((e) => e.date).where((d) => d.isNotEmpty).toSet().toList();
    dates.sort((a, b) => b.compareTo(a)); // newest first
    return dates;
  }

  static Future<List<String>> getSortedDatesDesc() async {
    final m = await getModel();
    return _sortedDatesDesc(m);
  }

  static Future<void> deleteDate(String date) async {
    final m = await getModel();
    final filtered = m.history.where((e) => e.date != date).toList();
    await overwriteModel(PortfolioHistory(history: filtered));
  }

  static Future<void> _duplicateEntry(String fromDate, String toDate, {bool overwrite = false}) async {
    final m = await getModel();
    final src = m.entryByDate(fromDate);
    if (src == null) return;
    final destExists = m.entryByDate(toDate) != null;
    if (destExists && !overwrite) return;

    HistoryEntry cloned = HistoryEntry(
      date: toDate,
      assets: src.assets.map((it) => FinancialItem(
        id: it.id,
        active: it.active,
        current: it.current,
        entity: it.entity,
        amount: it.amount,
        currency: it.currency,
        description: it.description,
      )).toList(),
      liabilities: src.liabilities.map((it) => FinancialItem(
        id: it.id,
        active: it.active,
        current: it.current,
        entity: it.entity,
        amount: it.amount,
        currency: it.currency,
        description: it.description,
      )).toList(),
    );

    final updated = m.upsertEntry(cloned);
    await overwriteModel(updated);
  }

  static Future<String?> copyLatestToDate(String toDate, {bool overwrite = false}) async {
    final m = await getModel();
    final dates = _sortedDatesDesc(m);
    if (dates.isEmpty) return null;
    final latest = dates.first;

    if (latest.compareTo(toDate) >= 0 && !overwrite) return null;

    await _duplicateEntry(latest, toDate, overwrite: overwrite);
    return toDate;
  }
}
