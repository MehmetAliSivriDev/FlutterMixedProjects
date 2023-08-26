import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_ticaret_uygulamasi/bloc/sepet_bloc.dart';

class SepetListesi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Sepetim",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
              stream: sepetBloc.getStream,
              initialData: sepetBloc.listeyiGetir(),
              builder: (context, snapshot) {
                return buildSepet(snapshot);
              },
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.attach_money),
            label: Text(
              "Ödemeye Geç",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
          ),
        ],
      ),
    );
  }

  Widget buildSepet(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, index) {
        final item = snapshot.data;
        return ListTile(
          title: Text(item[index].ad),
          subtitle: Text(
              "Ürünün Açıklaması: ${item[index].aciklama}\nÜrünün Fiyatı: ${item[index].fiyat.toString()}"),
          trailing: IconButton(
            onPressed: () {
              sepetBloc.sepettenSil(item[index]);
              AlertDialog alertDialog = new AlertDialog(
                title: Text("Sepetten Çıkart"),
                content: Text("Ürün Başarıyla Sepetten Çıkartıldı"),
              );
              showDialog(context: context, builder: (_) => alertDialog);
            },
            icon: Icon(Icons.remove),
          ),
        );
      },
    );
  }
}
