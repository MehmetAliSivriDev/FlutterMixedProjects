import 'package:flutter/material.dart';
import 'package:flutter_state_ogrlist/screens/ozelWidget.dart';

import 'ogrenci.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Ogrenciler seciliOgrenci = Ogrenciler(0, "", 0);

  List<Ogrenciler> ogrenciListesi = [
    Ogrenciler.withId(1, "Mehmet Ali Sivri", 2),
    Ogrenciler.withId(2, "Veysel Uğurlu", 2),
    Ogrenciler.withId(3, "Hasan Emre Bağrıyanık", 2),
    Ogrenciler.withId(4, "Mustafa Veysel", 4),
    Ogrenciler.withId(5, "Devrim", 4)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Ogrenci Listesi Uygulaması",
              style: TextStyle(color: Colors.white)),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: ogrenciListesi.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 199, 198, 198),
                      backgroundImage: NetworkImage(
                          "https://www.emiray.com.tr/tema/genel/uploads/ekibimiz/whatsapp-profiline-kendi-fotografini-koymayan-kisi_1132920.jpg"),
                    ),
                    title: Text(ogrenciListesi[index].adSoyad),
                    subtitle: Text(
                        "Sınıf :${ogrenciListesi[index].sinif}   ${kalanYil(ogrenciListesi[index].sinif)}"),
                    trailing: statusIcon(ogrenciListesi[index].sinif),
                    onTap: () {
                      setState(() {
                        seciliOgrenci = ogrenciListesi[index];
                      });
                    },
                  );
                },
              ),
            ),
            Text("Seçilen Kişi : ${seciliOgrenci.adSoyad}"),
            Row(
              children: <Widget>[
                Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green[300])),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Ekle"),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    OgrenciAdd(ogrenciListesi))).then((value) {
                          setState(() {});
                        });
                      },
                    )),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 236, 90, 79))),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.delete_outline),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Sil"),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          ogrenciListesi.remove(seciliOgrenci);
                        });

                        var alert = AlertDialog(
                            title: const Text("Silme İşlemi"),
                            content:
                                const Text("Silme İşlemi Gerçekleştirildi."));
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => alert);
                      },
                    ))
              ],
            ),
          ],
        ));
  }

  Widget statusIcon(int sinif) {
    if (sinif == 4) {
      return const Icon(Icons.check);
    } else {
      return const Icon(Icons.av_timer);
    }
  }

  String kalanYil(int sinif) {
    int kalan = 4 - sinif;
    return "Okulun Bitmesine Kalan Yıl : $kalan";
  }
}
