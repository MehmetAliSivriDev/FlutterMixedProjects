import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_e_ticaret_uygulamasi/db/dbHelper.dart';

import '../models/Urun.dart';
import 'UrunDetay.dart';
import 'UrunEkle.dart';

class UrunListesi extends StatefulWidget {
  const UrunListesi({super.key});

  @override
  State<StatefulWidget> createState() {
    return UrunListesiState();
  }
}

class UrunListesiState extends State {
  DbHelper dbHelper = new DbHelper();
  List<Urun>? urunler;
  int urunSayisi = 0;

  @override
  Widget build(Object context) {
    if (urunler == null) {
      urunler = <Urun>[];
      getUrunler();
    }

    return Scaffold(
      body: urunListesi(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          urunEkleyeGit();
        },
        child: Icon(Icons.add),
        tooltip: "Yeni Ürün Ekleme",
        backgroundColor: Colors.black,
      ),
    );
  }

  ListView urunListesi() {
    return ListView.builder(
        itemCount: urunSayisi,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.red,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.shopify_outlined),
              ),
              title: Text(
                this.urunler![position].ad,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                this.urunler![position].aciklama,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                detayaGit(this.urunler![position]);
              },
            ),
          );
        });
  }

  void getUrunler() {
    var dbFuture = dbHelper.dbOlustur();
    dbFuture.then((sonuc) {
      var urunlerFuture = dbHelper.getUrunler();
      urunlerFuture.then((data) {
        List<Urun> urunlerData = <Urun>[];
        var gelenUrunSayisi = data.length;
        for (int i = 0; i < gelenUrunSayisi; i++) {
          urunlerData.add(Urun.fromObjcet(data[i]));
        }
        setState(() {
          urunler = urunlerData;
          urunSayisi = gelenUrunSayisi;
        });
      });
    });
  }

  void detayaGit(Urun urun) async {
    var sonuc = await Navigator.push(
        context, MaterialPageRoute(builder: ((context) => UrunDetay(urun))));
    if (sonuc != null) {
      if (sonuc) {
        getUrunler();
      }
    }
  }

  void urunEkleyeGit() async {
    var sonuc = await Navigator.push(
        context, MaterialPageRoute(builder: ((context) => UrunEkle())));
    if (sonuc != null) {
      if (sonuc) {
        getUrunler();
      }
    }
  }
}
