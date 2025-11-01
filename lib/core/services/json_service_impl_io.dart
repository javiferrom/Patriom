import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'json_service_platform.dart';

final JsonServicePlatform jsonServicePlatform = _JsonServiceImplIO();

class _JsonServiceImplIO implements JsonServicePlatform {
  Future<File> _getLocalFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/patriom_data.json');
  }

  @override
  Future<void> saveJson(Map<String, dynamic> data) async {
    final file = await _getLocalFile();
    final jsonStr = const JsonEncoder.withIndent('  ').convert(data);
    await file.writeAsString(jsonStr);
  }

  @override
  Future<Map<String, dynamic>?> loadLocalJson() async {
    final file = await _getLocalFile();
    if (await file.exists()) {
      try {
        final contents = await file.readAsString();
        final decoded = jsonDecode(contents);
        if (decoded is Map<String, dynamic>) return decoded;
      } catch (_) {
      }
    }
    return null;
  }

  @override
  Future<Map<String, dynamic>?> pickJsonFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['json'],
      withData: true,
    );
    if (result == null) return null;

    final bytes = result.files.single.bytes;
    if (bytes != null) {
      try {
        final content = utf8.decode(bytes);
        final decoded = jsonDecode(content);
        return decoded is Map<String, dynamic> ? decoded : null;
      } catch (_) {
        return null;
      }
    }

    final path = result.files.single.path;
    if (path != null) {
      try {
        final file = File(path);
        final content = await file.readAsString();
        final decoded = jsonDecode(content);
        return decoded is Map<String, dynamic> ? decoded : null;
      } catch (_) {
        return null;
      }
    }

    return null;
  }
}
