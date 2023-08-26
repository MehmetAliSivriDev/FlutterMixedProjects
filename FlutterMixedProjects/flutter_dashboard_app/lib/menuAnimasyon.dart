import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuAnimasyon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuAnimasyonState();
  }
}

class _MenuAnimasyonState extends State<MenuAnimasyon> {
  late double ekranGenisligi;
  bool menuAcikMi = false;

  @override
  Widget build(BuildContext context) {
    ekranGenisligi = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            menuOlustur(context),
            dashBoardOlustur(context),
          ],
        ),
      ),
    );
  }

  Widget menuOlustur(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                label: Text(
                  "Profilim",
                  style: TextStyle(color: Colors.black),
                )),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                ),
                label: Text(
                  "Siparişlerim",
                  style: TextStyle(color: Colors.black),
                )),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.call,
                  color: Colors.red,
                ),
                label: Text(
                  "Müşteri Hizmetleri",
                  style: TextStyle(color: Colors.black),
                )),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: Colors.red,
                ),
                label: Text(
                  "Ayarlar",
                  style: TextStyle(color: Colors.black),
                )),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                ),
                label: Text(
                  "Çıkış Yap",
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }

  Widget dashBoardOlustur(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 200),
      top: 0,
      bottom: 0,
      left: menuAcikMi ? 0.5 * ekranGenisligi : 0,
      right: menuAcikMi ? -0.4 * ekranGenisligi : 0,
      child: Material(
        elevation: 8,
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        menuAcikMi = !menuAcikMi;
                      });
                    },
                    child: Icon(Icons.menu),
                  ),
                  Text("Uygulama Adı"),
                  Icon(Icons.add_alert_sharp)
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 200,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      child: Image.network(
                          "https://imgrosetta.mynet.com.tr/file/13485612/13485612-728xauto.jpg"),
                      width: 100,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    Container(
                      child: Image.network(
                          "https://i.cnnturk.com/i/cnnturk/75/0x555/62fde62217aca918704d2f3b"),
                      width: 100,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    Container(
                      child: Image.network(
                          "https://im.haberturk.com/2022/10/28/3533816_42303e3ffe771f68575b7ed714c625cf_640x640.jpg"),
                      width: 100,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
