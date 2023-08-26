import 'package:flutter/material.dart';

import 'gridview.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GridView Kullanımı")),
      body: GridViewDemo(),
    );
  }
}
