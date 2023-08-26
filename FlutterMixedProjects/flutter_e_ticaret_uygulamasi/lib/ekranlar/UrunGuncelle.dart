import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_ticaret_uygulamasi/db/dbHelper.dart';
import 'package:flutter_e_ticaret_uygulamasi/main.dart';
import 'package:flutter_e_ticaret_uygulamasi/models/Urun.dart';

class UrunGuncelle extends StatefulWidget {
  late Urun urun;
  UrunGuncelle(this.urun);
  @override
  State<StatefulWidget> createState() {
    return UrunGuncelleState(urun);
  }
}

class UrunGuncelleState extends State {
  late Urun urun;
  UrunGuncelleState(this.urun);
  DbHelper dbHelper = new DbHelper();

  TextEditingController yeniAd = new TextEditingController();
  TextEditingController yeniAciklama = new TextEditingController();
  TextEditingController yeniFiyat = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ürün Güncelleme",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.shopping_bag_rounded),
                title: Text("Eski Ad: ${urun.ad}"),
                subtitle: Text(
                    "Eski Açıklama: ${urun.aciklama}\nEski Fiyat: ${urun.fiyat}"),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              TextField(
                controller: yeniAd,
                decoration: InputDecoration(
                  labelText: "Ürünün Yeni Adını Giriniz",
                  hintText: "Yeni Ad",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  icon: Icon(Icons.abc),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              TextField(
                controller: yeniAciklama,
                decoration: InputDecoration(
                  labelText: "Ürünün Yeni Açıklamasını Giriniz",
                  hintText: "Yeni Açıklama",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  icon: Icon(Icons.pending_rounded),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              TextField(
                controller: yeniFiyat,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Ürünün Yeni Fiyatını Giriniz",
                  hintText: "Yeni Fiyat",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  icon: Icon(Icons.attach_money_outlined),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              ElevatedButton(
                onPressed: () {
                  guncelle();
                },
                child: Text(
                  "Güncelle",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void guncelle() async {
    int sonuc = await dbHelper.guncelle(urun.id!,
        Urun(yeniAd.text, yeniAciklama.text, double.tryParse(yeniFiyat.text)!));

    if (sonuc != 0) {
      AlertDialog alertDialog = new AlertDialog(
        title: Text("Ürün Güncelleme"),
        content: Text("Ürün Güncelleme Başarıyla Gerçekleştirildi."),
      );
      showDialog(context: context, builder: (_) => alertDialog);
      await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => Anasayfa(), maintainState: true),
          (Route<dynamic> route) => false);
    }
  }
}
