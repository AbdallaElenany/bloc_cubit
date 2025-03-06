import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final int tab;

  const Screen({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white12,
      appBar: AppBar(title: Text('Page Tab $tab')),
      body: Center(child: Text('Tab $tab')),
    );
  }
}
