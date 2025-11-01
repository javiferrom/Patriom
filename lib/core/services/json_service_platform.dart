abstract class JsonServicePlatform {
  Future<void> saveJson(Map<String, dynamic> data);
  Future<Map<String, dynamic>?> loadLocalJson();
  Future<Map<String, dynamic>?> pickJsonFile();
}