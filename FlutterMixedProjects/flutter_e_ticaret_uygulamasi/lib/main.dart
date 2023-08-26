import 'package:flutter/material.dart';
import 'package:flutter_e_ticaret_uygulamasi/db/dbHelper.dart';
import 'package:flutter_e_ticaret_uygulamasi/ekranlar/SepetListesi.dart';
import 'package:flutter_e_ticaret_uygulamasi/models/Urun.dart';

import 'ekranlar/UrunListesi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DbHelper dbHelper = new DbHelper();
    dbHelper.dbOlustur().then((database) => {});

    /*Urun urun1 = new Urun("Televizyon", "Led", 10000);
    dbHelper.ekle(urun1);

    Urun urun2 = new Urun("Telefon", "iphone", 15000);
    dbHelper.ekle(urun2);

    Urun urun3 = new Urun("Utu", "buharli", 7000);
    dbHelper.ekle(urun3);*/

    return MaterialApp(
      title: "E-Ticaret Uygulaması",
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<StatefulWidget> createState() {
    return AnasayfaState();
  }
}

class AnasayfaState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Ticaret Uygulaması"),
        backgroundColor: Colors.black,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SepetListesi(),
                        maintainState: true),
                    (Route<dynamic> route) => true);
              },
              icon: Icon(Icons.shopping_basket),
            ),
          ),
        ],
      ),
      body: UrunListesi(),
    );
  }
}
