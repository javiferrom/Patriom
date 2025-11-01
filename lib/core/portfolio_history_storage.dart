import 'dart:convert';
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class PortfolioHistoryStorage {
  const PortfolioHistoryStorage._();

  static const String _prefsKey = 'portfolio_history_json';
  static const JsonEncoder _pretty = JsonEncoder.withIndent('  ');

  static Map<String, dynamic> emptyStructure() => {
    "history": [
      {"date": "", "assets": [], "liabilities": []}
    ]
  };

  static Future<Map<String, dynamic>> loadOrCreate() async {
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getString(_prefsKey);
    if (existing != null && existing.trim().isNotEmpty) {
      return _safeDecode(existing);
    }
    final empty = emptyStructure();
    await prefs.setString(_prefsKey, _pretty.convert(empty));
    return empty;
  }

  static Future<void> resetToEmpty() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, _pretty.convert(emptyStructure()));
  }

  static Future<Map<String, dynamic>> getJson() async {
    final prefs = await SharedPreferences.getInstance();
    final content = prefs.getString(_prefsKey);
    if (content == null || content.trim().isEmpty) {
      return await loadOrCreate();
    }
    try {
      return _safeDecode(content);
    } catch (_) {
      await resetToEmpty();
      return emptyStructure();
    }
  }

  static Future<void> importAndOverwrite(String rawJson) async {
    final decoded = _safeDecode(rawJson);
    _validateShape(decoded);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, _pretty.convert(decoded));
  }

  static Future<void> export({String fileName = 'portfolio_history.json'}) async {
    final prefs = await SharedPreferences.getInstance();
    final content = prefs.getString(_prefsKey) ?? _pretty.convert(emptyStructure());

    if (kIsWeb) {
      await SharePlus.instance.share(
        ShareParams(
          text: content,
          subject: fileName,
        ),
      );
      return;
    }

    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$fileName');
    await file.writeAsString(content);

    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(file.path)],
        text: 'Exported $fileName',
        subject: fileName,
      ),
    );
  }

  static Future<void> overwrite(Map<String, dynamic> data) async {
    _validateShape(data);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, _pretty.convert(data));
  }

  static Future<String> getJsonString() async {
    final data = await getJson();
    return _pretty.convert(data);
  }

  static Map<String, dynamic> _safeDecode(String raw) {
    final decoded = json.decode(raw);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('JSON root must be an object');
    }
    _validateShape(decoded);
    return decoded;
  }

  static void _validateShape(Map<String, dynamic> root) {
    if (!root.containsKey('history') || root['history'] is! List) {
      throw const FormatException('JSON must contain "history" as a List');
    }
    for (final entry in root['history'] as List) {
      if (entry is! Map) continue;
      final e = entry;
      if (!e.containsKey('date') ||
          !e.containsKey('assets') ||
          !e.containsKey('liabilities')) {
        throw const FormatException('Each history item must have "date", "assets", "liabilities"');
      }
    }
  }
}
