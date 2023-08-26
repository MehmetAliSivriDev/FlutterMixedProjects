import 'package:flutter/material.dart';
import 'package:flutter_dashboard_app/menuAnimasyon.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dashboard Menü",
      home: MenuAnimasyon(),
    );
  }
}
