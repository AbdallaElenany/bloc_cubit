import 'package:flutter/material.dart';
import '../core/services/offline_service/data_service.dart';
import '../core/services/offline_service/offline_sync_service.dart';

class SendDataTest extends StatefulWidget {
  const SendDataTest({super.key});

  @override
  State<SendDataTest> createState() => _SendDataTestState();
}

class _SendDataTestState extends State<SendDataTest> {
  @override
  void dispose() {
    OfflineSyncService.stopListening();
    super.dispose();
  }

  void _sendData() async {
    Map<String, dynamic> data = {
      "Email": "abdalla.m.elenany@gmail.com",
      "Password": "12345",
    };

    await DataService.sendData(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("إرسال البيانات")),
      body: Center(
        child: ElevatedButton(
          onPressed: _sendData,
          child: Text("إرسال البيانات"),
        ),
      ),
    );
  }
}
