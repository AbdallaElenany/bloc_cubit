import 'package:connectivity_plus/connectivity_plus.dart';
import '../../share_widgets/custom_alert_dialog.dart';
import 'offline_storage_service.dart';
import 'package:dio/dio.dart';

class DataService {
  static final Dio _dio = Dio();

  static Future<void> sendData(Map<String, dynamic> data) async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      OfflineStorageService.saveRequest(
        "http://elhagry-001-site17.ftempurl.com/api/appuser/loginbyemail",
        data,
      ); // حفظ البيانات مؤقتًا
      showAlert("تم تخزين", "تم تخزين البيانات في Hive لعدم توفر الإنترنت.");
    } else {
      try {
        Response response = await _dio.post(
          "http://elhagry-001-site17.ftempurl.com/api/appuser/loginbyemail",
          data: data,
          options: Options(
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Accept-Language': 'en',
            },
          ),
        );
        if (response.statusCode == 200) {
          showAlert("نجاح", " تم إرسال البيانات بنجاح.");
        }
      } catch (e) {
        showAlert("فشل", " فشل الإرسال، سيتم تخزين البيانات.");
        OfflineStorageService.saveRequest(
          "http://elhagry-001-site17.ftempurl.com/api/appuser/loginbyemail",
          data,
        );
      }
    }
  }
}
