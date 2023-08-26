import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  TextEditingController nKisa1 = new TextEditingController();
  TextEditingController nKisa2 = new TextEditingController();
  TextEditingController nOdev = new TextEditingController();
  TextEditingController nVize = new TextEditingController();
  TextEditingController nFinal = new TextEditingController();

  double toplam = 0;
  double vizeN = 0;
  double finalN = 0;
  double kisa1N = 0;
  double kisa2N = 0;
  double odevN = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            selamVer() + " Harf Notu Hesaplama Programı",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          margin: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Kısa Sınav 1 Notu (%10)",
                    hintText: "Kısa Sınav 1",
                    border: OutlineInputBorder()),
                controller: nKisa1,
              ),
              const SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Kısa Sınav 2 Notu (%10)",
                    hintText: "Kısa Sınav 2",
                    border: OutlineInputBorder()),
                controller: nKisa2,
              ),
              const SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Ödev Notu (%10)",
                    hintText: "Ödev",
                    border: OutlineInputBorder()),
                controller: nOdev,
              ),
              const SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Vize Notu (%20)",
                    hintText: "Vize",
                    border: OutlineInputBorder()),
                controller: nVize,
              ),
              const SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Final Notu (%50)",
                    hintText: "Final",
                    border: OutlineInputBorder()),
                controller: nFinal,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text(
                    "Hesapla",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    kisa1N = double.parse(nKisa1.text);
                    kisa2N = double.parse(nKisa2.text);
                    odevN = double.parse(nOdev.text);
                    vizeN = double.parse(nVize.text);
                    finalN = double.parse(nFinal.text);
                    vizeN = (vizeN * 2) / 10;
                    finalN = (finalN * 5) / 10;
                    kisa1N = (kisa1N * 1) / 10;
                    kisa2N = (kisa2N * 1) / 10;
                    odevN = (odevN * 1) / 10;

                    toplam = vizeN + finalN + kisa1N + kisa2N + odevN;

                    var alert = AlertDialog(
                      title: const Text("Ortalama ve Harf Notu :"),
                      content: Text(
                          "Ortalamanız : $toplam\nHarf Notunuz : ${harfNotu(toplam)}"),
                    );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => alert);
                  }),
            ],
          ),
        ));
  }
}

String selamVer() {
  DateTime time = new DateTime.now();
  int hour = time.hour;

  if (hour < 12) {
    return "Günaydın!";
  } else if (hour < 18) {
    return "İyi Günler!";
  } else {
    return "İyi Akşamlar!";
  }
}

String harfNotu(puan) {
  if (puan >= 90) {
    return "Harn Notunuz : AA";
  } else if (puan >= 85) {
    return "Harf Notunuz : BA";
  } else if (puan >= 80) {
    return "Harf Notunuz : BB";
  } else if (puan >= 75) {
    return "Harf Notunuz : CB";
  } else if (puan >= 70) {
    return "Harf Notunuz : CC";
  } else if (puan >= 65) {
    return "Harf Notunuz : DC";
  } else if (puan >= 60) {
    return "Harf Notunuz : DD";
  } else if (puan >= 55) {
    return "Harf Notunuz : FD";
  } else {
    return "Harf Notunuz : FF";
  }
}
