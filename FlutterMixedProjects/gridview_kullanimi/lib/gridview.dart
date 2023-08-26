import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 32,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Container(
            alignment: Alignment.center,
            color: Colors.red[100 * (index % 10)],
            child: Text(
              "Bölüm $index",
              textAlign: TextAlign.center,
            ));
      },
    );
  }
}

class GridViewDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(10.0),
      crossAxisSpacing: 15,
      mainAxisSpacing: 20,
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            color: Colors.blue[100],
            child: const Text("Bölüm 1")),
        Container(
            alignment: Alignment.center,
            color: Colors.blue[200],
            child: const Text("Bölüm 2")),
        Container(
            alignment: Alignment.center,
            color: Colors.blue[300],
            child: const Text("Bölüm 3")),
        Container(
            alignment: Alignment.center,
            color: Colors.blue[100],
            child: const Text("Bölüm 4")),
        Container(
            alignment: Alignment.center,
            color: Colors.blue[400],
            child: const Text("Bölüm 5")),
        Container(
            alignment: Alignment.center,
            color: Colors.blue[500],
            child: const Text("Bölüm 6")),
        Container(
            alignment: Alignment.center,
            color: Colors.blue[600],
            child: const Text("Bölüm 7")),
        Container(
            alignment: Alignment.center,
            color: Colors.blue[700],
            child: const Text("Bölüm 8")),
      ],
    );
  }
}
