import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Merhaba Ilk Uygulamamız!"),
        ),
        body: Center(
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
                })));
  }
}
