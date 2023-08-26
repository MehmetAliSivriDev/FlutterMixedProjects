import 'package:flutter_e_ticaret_uygulamasi/bloc/sepet_bloc.dart';
import 'package:flutter_e_ticaret_uygulamasi/db/dbHelper.dart';
import 'package:flutter_e_ticaret_uygulamasi/ekranlar/UrunGuncelle.dart';
import 'package:flutter_e_ticaret_uygulamasi/models/Urun.dart';
import 'package:flutter/material.dart';

class UrunDetay extends StatefulWidget {
  late Urun urun;
  UrunDetay(this.urun);

  @override
  State<StatefulWidget> createState() {
    return UrunDetayState(urun);
  }
}

enum Secenek { Sil, Guncelle }

DbHelper dbHelper = new DbHelper();

class UrunDetayState extends State {
  late Urun urun;
  UrunDetayState(this.urun);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "${urun.ad}",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            PopupMenuButton<Secenek>(
                onSelected: islemSec,
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<Secenek>>[
                      PopupMenuItem<Secenek>(
                        value: Secenek.Sil,
                        child: Text("Ürün Sil"),
                      ),
                      PopupMenuItem<Secenek>(
                        value: Secenek.Guncelle,
                        child: Text("Ürün Güncelle"),
                      )
                    ])
          ],
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.shop),
              title: Text(urun.ad),
              subtitle: Text(urun.aciklama),
            ),
            Text("${urun.ad} Fiyatı : ${urun.fiyat} TL"),
            ButtonBar(
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    sepetBloc.sepeteEkle(urun);
                    AlertDialog alertDialog = new AlertDialog(
                      title: Text("Sepet'e Ekleme"),
                      content: Text("Ürün Başarıyla Sepete Eklendi"),
                    );
                    showDialog(context: context, builder: (_) => alertDialog);
                  },
                  label: Text("Sepete Ekle"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  icon: Icon(Icons.shopping_basket),
                )
              ],
            )
          ],
        )));
  }

  void islemSec(Secenek secenek) async {
    int sonuc;

    switch (secenek) {
      case Secenek.Sil:
        Navigator.pop(context, true);
        sonuc = await dbHelper.sil(urun.id!);
        if (sonuc != 0) {
          AlertDialog alertDialog = new AlertDialog(
            title: Text("Silme İşlemi"),
            content: Text(
                "Silme İşlemi Başarıyla Gerçekleştirildi.\nSilinen Ürün : ${urun.ad}"),
          );
          showDialog(context: context, builder: (_) => alertDialog);
        }
        break;
      case Secenek.Guncelle:
        await Navigator.push(context,
            MaterialPageRoute(builder: ((context) => UrunGuncelle(urun))));
    }
  }
}
