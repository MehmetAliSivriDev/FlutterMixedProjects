import 'package:flutter_e_ticaret_uygulamasi/db/dbHelper.dart';
import 'package:flutter_e_ticaret_uygulamasi/models/Urun.dart';
import 'package:flutter/material.dart';

class UrunEkle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UrunEkleState();
  }
}

class UrunEkleState extends State {
  DbHelper dbHelper = new DbHelper();
  TextEditingController txtAd = new TextEditingController();
  TextEditingController txtAciklama = new TextEditingController();
  TextEditingController txtFiyat = new TextEditingController();

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Ekleme Sayfası"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: txtAd,
              decoration: InputDecoration(
                  labelText: "Ürün Adı",
                  hintText: "Ürünün Adını Giriniz",
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.abc)),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            TextField(
              controller: txtAciklama,
              decoration: InputDecoration(
                  labelText: "Ürün Açıklaması",
                  hintText: "Ürünün Açıklamasını Giriniz",
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.pending_rounded)),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            TextField(
              controller: txtFiyat,
              decoration: InputDecoration(
                  labelText: "Ürün Fiyatı",
                  hintText: "Ürünün Fiyatını Giriniz",
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.attach_money_outlined)),
              keyboardType: TextInputType.number,
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            ElevatedButton(
              onPressed: () {
                ekle();
              },
              child: Text("Ekle"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
            )
          ],
        ),
      ),
    );
  }

  void ekle() async {
    int sonuc = await dbHelper.ekle(
        Urun(txtAd.text, txtAciklama.text, double.tryParse(txtFiyat.text)!));

    if (sonuc != 0) {
      Navigator.pop(context, true);
      AlertDialog alertDialog = new AlertDialog(
        title: Text("Ürün Ekleme"),
        content: Text("Ürün Ekleme İşlemi Başarıyla Gerçekleştirildi"),
      );
      showDialog(context: context, builder: (_) => alertDialog);
    }
  }
}
