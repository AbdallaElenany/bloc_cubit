import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF0E0DC1), // غامق في اليسار
           // Color(0xFF4B47FF), // فاتح في النص

           // Color(0xFF4B47FF), // فاتح في النص
            Color(0xFF0E0DC1), // غامق في اليمين
          ],
        ),
      ),
      child: Center(
        child: Text(
          'Save',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
