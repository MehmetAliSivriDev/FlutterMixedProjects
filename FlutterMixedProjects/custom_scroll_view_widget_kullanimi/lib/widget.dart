import 'package:flutter/material.dart';

class widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: const Text(
            "Sliver App Bar",
            style: TextStyle(color: Colors.black),
          ),
          pinned: true,
          centerTitle: true,
          backgroundColor: Colors.red,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              "Sliver App Bar",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            background: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAYj2d41hev6B-IJ8kACOGh10nHZTM2yUdmA&usqp=CAU",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(delegate: SliverChildListDelegate(listeElamanlari()))
      ],
    );
  }
}

List<Widget> listeElamanlari() {
  return [
    GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: 16,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 5),
          height: 250,
          alignment: Alignment.center,
          color: Colors.red[100 * (index % 9)],
          child: Text("Bölüm $index", textAlign: TextAlign.center),
        );
      },
    )
  ];
}

List<Widget> listeElamanlari2() {
  return [
    Container(
        height: 250,
        alignment: Alignment.center,
        color: Colors.blue[100],
        child: const Text("Bölüm 1")),
    Container(
        height: 250,
        alignment: Alignment.center,
        color: Colors.blue[200],
        child: const Text("Bölüm 2")),
    Container(
        height: 250,
        alignment: Alignment.center,
        color: Colors.blue[300],
        child: const Text("Bölüm 3")),
    Container(
        height: 250,
        alignment: Alignment.center,
        color: Colors.blue[100],
        child: const Text("Bölüm 4")),
    Container(
        height: 250,
        alignment: Alignment.center,
        color: Colors.blue[400],
        child: const Text("Bölüm 5")),
    Container(
        height: 250,
        alignment: Alignment.center,
        color: Colors.blue[500],
        child: const Text("Bölüm 6")),
    Container(
        height: 250,
        alignment: Alignment.center,
        color: Colors.blue[600],
        child: const Text("Bölüm 7")),
    Container(
        height: 250,
        alignment: Alignment.center,
        color: Colors.blue[700],
        child: const Text("Bölüm 8")),
  ];
}
