import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import '../../share_widgets/custom_alert_dialog.dart';
import 'offline_storage_service.dart';

class OfflineSyncService {
  static final Dio _dio = Dio();
  static StreamSubscription? _subscription;

  static void startListening() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      if (results.contains(ConnectivityResult.wifi) ||
          results.contains(ConnectivityResult.mobile)) {
        _syncDataWithServer();
      }
    });
  }

  static Future<void> _syncDataWithServer() async {
    List<Map<String, dynamic>> pendingRequests =
        OfflineStorageService.getPendingRequests();

    if (pendingRequests.isEmpty) return;

    List<int> successfullySentKeys = [];

    for (var request in pendingRequests) {
      try {
        String apiUrl = request["url"];
        Map<String, dynamic> requestData = request["data"];
        int requestKey = request["key"];

        Response response = await _dio.post(
          apiUrl,
          data: requestData,
          options: Options(
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Accept-Language': 'en',
            },
          ),
        );

        if (response.statusCode == 200) {
          successfullySentKeys.add(requestKey);
          showAlert("نجاح", " تم إرسال البيانات بنجاح.");
        }
      } catch (e) {
        showAlert("فشل", " فشل إرسال الطلب برقم المفتاح $request: $e");
      }
    }

    for (int key in successfullySentKeys) {
      OfflineStorageService.removeRequest(key);
    }
  }

  static void stopListening() {
    _subscription?.cancel();
  }
}
