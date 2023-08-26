import 'package:custom_scroll_view_widget_kullanimi/widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Liste Çeşitleri",
        home: Scaffold(
          body: widget(),
        ));
  }
}
