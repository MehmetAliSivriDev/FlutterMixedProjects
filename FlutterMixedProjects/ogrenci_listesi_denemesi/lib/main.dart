import 'package:flutter/material.dart';
import 'package:ogrenci_listesi_denemesi/ogrenciler.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Ogrenciler> ogrenciListesi = [
      Ogrenciler("Mehmet Ali Sivri", 2),
      Ogrenciler("Veysel Uğurlu", 2),
      Ogrenciler("Hasan Emre Bağrıyanık", 2),
      Ogrenciler("Devrim", 4)
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Öğrenci Listesi",
            style: TextStyle(
              color: Colors.white,
            )),
      ),
      body: Column(children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: ogrenciListesi.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://www.emiray.com.tr/tema/genel/uploads/ekibimiz/whatsapp-profiline-kendi-fotografini-koymayan-kisi_1132920.jpg"),
                    ),
                    title: Text(ogrenciListesi[index].adSoyad),
                    subtitle: Text(
                        "Sınıfı :" + ogrenciListesi[index].sinif.toString()),
                    trailing: statusIcon(ogrenciListesi[index].sinif),
                    onTap: () {
                      var alert = AlertDialog(
                        title: const Text("Öğrenci Bilgileri"),
                        content: Text(kalanYil(ogrenciListesi[index].sinif)),
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => alert);
                    },
                  );
                })),
      ]),
    );
  }

  Widget statusIcon(int sinif) {
    if (sinif <= 2) {
      return const Icon(Icons.av_timer);
    } else if (sinif == 4) {
      return const Icon(Icons.check);
    } else {
      return const Icon(Icons.av_timer);
    }
  }
}

String kalanYil(int sinif) {
  int kalan = 4 - sinif;

  return "Okulun Bitmesine Kalan Yıl : " + kalan.toString();
}
