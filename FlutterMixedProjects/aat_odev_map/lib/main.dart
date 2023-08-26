import 'package:aat_odev_map/map1.dart';
import 'package:flutter/material.dart';

import 'map2.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'Map App', home: Map2());
  }
}
