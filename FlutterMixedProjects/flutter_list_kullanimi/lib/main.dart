import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var Ogrenciler = [
      "Mehmet Ali Sivri",
      "Hasan Emre Bagriyanik",
      "Veysel Ugurlu",
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text("Ogrenci Liste Sıralama Uygulaması!"),
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: Ogrenciler.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(Ogrenciler[index]);
                  })),
          Center(
              child: ElevatedButton(
                  child: const Text("Sınav Sonucunu Getir"),
                  onPressed: () {
                    int puan = 35;
                    String mesaj = "";

                    if (puan >= 50) {
                      mesaj = "Dersten Geçtin";
                    } else if (puan >= 45) {
                      mesaj = "Dersten Koşullu Geçtin";
                    } else if (puan < 45) {
                      mesaj = "Dersten Kaldın!";
                    }

                    var alert = AlertDialog(
                      title: const Text("Sınav Sonucu"),
                      content: Text(mesaj),
                    );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => alert);
                  }))
        ]));
  }
}
