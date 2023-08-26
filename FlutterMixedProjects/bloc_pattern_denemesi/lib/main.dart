import 'package:bloc_pattern_denemesi/screens/cart_screen.dart';
import 'package:bloc_pattern_denemesi/screens/lesson_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (BuildContext context) => LessonListScreen(),
        "/cart": (BuildContext context) => CartScreen(),
      },
      initialRoute: "/",
    );
  }
}
