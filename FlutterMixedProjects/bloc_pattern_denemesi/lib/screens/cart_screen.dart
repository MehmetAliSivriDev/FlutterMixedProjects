import 'package:bloc_pattern_denemesi/blocs/cart_bloc.dart';
import 'package:bloc_pattern_denemesi/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Seçilen Dersler",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder(
          stream: cartBloc.getStream,
          initialData: cartBloc.getCart(),
          builder: (context, snapshot) {
            return buildCart(snapshot);
          }),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, index) {
        final cart = snapshot.data;
        return ListTile(
          title: Text(cart[index].lesson.name),
          subtitle: Text("Kredisi: ${cart[index].lesson.point.toString()}"),
          trailing: IconButton(
              onPressed: () {
                cartBloc.removeFromCart(cart[index]);
                AlertDialog alertDialog = new AlertDialog(
                  title: Text("Silme İşlemi"),
                  content: Text("Silme İşlemi Başarıyla Gerçekleştirildi."),
                );
                showDialog(context: context, builder: (_) => alertDialog);
              },
              icon: Icon(Icons.remove)),
        );
      },
    );
  }
}
