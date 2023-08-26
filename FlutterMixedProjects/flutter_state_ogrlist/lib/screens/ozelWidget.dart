import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_ogrlist/validation/ogrenciValidator.dart';

import '../ogrenci.dart';

class OgrenciAdd extends StatefulWidget {
  late List<Ogrenciler> ogrenciListesi;
  OgrenciAdd(List<Ogrenciler> ogrenciListesi) {
    this.ogrenciListesi = ogrenciListesi;
  }

  @override
  State<StatefulWidget> createState() {
    return _OgrenciAddState(ogrenciListesi);
  }
}

class _OgrenciAddState extends State with OgrenciValidationMixin {
  var ogrenci = Ogrenciler.withOutInfo();
  var formKey = GlobalKey<FormState>();
  late List<Ogrenciler> ogrenciListesi;

  _OgrenciAddState(List<Ogrenciler> ogrenciListesi) {
    this.ogrenciListesi = ogrenciListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Yeni Öğrenci Ekleme",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          margin: const EdgeInsets.all(25.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Öğrenci Adı Soyadı",
                        hintText: "Ad Soyad",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.account_circle)),
                    validator: ((value) {
                      return validateAdSoyad(value.toString());
                    }),
                    onSaved: (value) {
                      ogrenci.adSoyad = value.toString();
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Sınıfı",
                        hintText: "Sınıf",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.class_outlined)),
                    validator: ((value) {
                      return validateSinif(value.toString());
                    }),
                    onSaved: (value) {
                      ogrenci.sinif = int.parse(value.toString());
                    },
                  ),
                  kaydetButonu(),
                ],
              )),
        ));
  }

  Widget kaydetButonu() {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
      child: const Text("Kaydet", style: TextStyle(color: Colors.white)),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();
          ogrenciListesi.add(ogrenci);
          Navigator.pop(context);
        }
      },
    );
  }
}
