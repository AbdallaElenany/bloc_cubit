import 'package:flutter/material.dart';
import '../helpers/navigation_service.dart';

void showAlert(String title, String message) {
  showDialog(
    context: NavigationService.context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("حسناً"),
          ),
        ],
      );
    },
  );
}
