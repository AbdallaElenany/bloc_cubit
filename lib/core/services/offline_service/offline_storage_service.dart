import 'package:hive/hive.dart';

class OfflineStorageService {
  static late Box _box;

  /// فتح الصندوق عند بدء التطبيق
  static Future<void> init() async {
    _box = await Hive.openBox('offline_requests');
  }

  /// حفظ الطلبات مع الرابط
  static Future<void> saveRequest(
      String apiUrl, Map<String, dynamic> data) async {
    await _box.add({
      "url": apiUrl,
      "data": data,
    });
  }

  /// استرجاع جميع الطلبات
  static List<Map<String, dynamic>> getPendingRequests() {
    return _box.keys
        .map((key) {
          final value = _box.get(key);

          if (value is Map) {
            return {
              "key": key,
              "url": value["url"] as String,
              "data": Map<String, dynamic>.from(value["data"]),
            };
          }
          return null;
        })
        .where((element) => element != null)
        .cast<Map<String, dynamic>>()
        .toList();
  }

  /// حذف طلب معين
  static Future<void> removeRequest(int key) async {
    await _box.delete(key);
  }
}
