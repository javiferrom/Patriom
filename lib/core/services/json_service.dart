import 'dart:convert';

import 'json_service_impl_io.dart'
if (dart.library.html) 'json_service_impl_web.dart' as impl;

class JsonService {
  static Future<void> saveJson(Map<String, dynamic> data) {
    return impl.jsonServicePlatform.saveJson(data);
  }

  static Future<Map<String, dynamic>?> loadLocalJson() {
    return impl.jsonServicePlatform.loadLocalJson();
  }

  static Future<Map<String, dynamic>?> pickJsonFile() {
    return impl.jsonServicePlatform.pickJsonFile();
  }

  static String encode(Map<String, dynamic> data) => const JsonEncoder.withIndent('  ').convert(data);
  static Map<String, dynamic> decode(String source) => jsonDecode(source) as Map<String, dynamic>;
}
