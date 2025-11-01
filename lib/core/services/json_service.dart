import 'dart:convert';
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:html' as html;

class JsonService {
  static Future<File> _getLocalFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/patriom_data.json');
  }

  static Future<void> saveJson(Map<String, dynamic> data) async {
    final jsonStr = jsonEncode(data);

    if (kIsWeb) {
      final bytes = utf8.encode(jsonStr);
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', 'patriom_data.json')
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      final file = await _getLocalFile();
      await file.writeAsString(jsonStr);
    }
  }

  static Future<Map<String, dynamic>?> loadLocalJson() async {
    if (kIsWeb) return null;
    final file = await _getLocalFile();
    if (await file.exists()) {
      final contents = await file.readAsString();
      return jsonDecode(contents);
    }
    return null;
  }

  static Future<Map<String, dynamic>?> pickJsonFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      withData: true,
    );
    if (result == null) return null;

    final bytes = result.files.single.bytes;
    if (bytes != null) {
      final content = utf8.decode(bytes);
      return jsonDecode(content);
    }

    if (result.files.single.path != null) {
      final file = File(result.files.single.path!);
      final content = await file.readAsString();
      return jsonDecode(content);
    }

    return null;
  }
}
