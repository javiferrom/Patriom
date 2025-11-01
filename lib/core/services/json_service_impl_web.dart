import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;

import 'package:file_picker/file_picker.dart';

import 'json_service_platform.dart';

final JsonServicePlatform jsonServicePlatform = _JsonServiceImplWeb();

class _JsonServiceImplWeb implements JsonServicePlatform {
  static const _storageKey = 'patriom_data.json';

  @override
  Future<void> saveJson(Map<String, dynamic> data) async {
    final jsonStr = const JsonEncoder.withIndent('  ').convert(data);

    final bytes = Uint8List.fromList(utf8.encode(jsonStr));
    final blob = html.Blob([bytes], 'application/json');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..download = 'patriom_data.json'
      ..click();
    html.Url.revokeObjectUrl(url);

    try {
      html.window.localStorage[_storageKey] = jsonStr;
    } catch (_) {
    }
  }

  @override
  Future<Map<String, dynamic>?> loadLocalJson() async {
    try {
      final str = html.window.localStorage[_storageKey];
      if (str == null) return null;
      final decoded = jsonDecode(str);
      return decoded is Map<String, dynamic> ? decoded : null;
    } catch (_) {
      return null;
    }
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

    return null;
  }
}
