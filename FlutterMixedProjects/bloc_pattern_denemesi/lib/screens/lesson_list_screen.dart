import 'package:bloc_pattern_denemesi/blocs/cart_bloc.dart';
import 'package:bloc_pattern_denemesi/blocs/lesson_bloc.dart';
import 'package:bloc_pattern_denemesi/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Dersler",
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(Icons.library_books),
        actions: <Widget>[
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart"),
              icon: Icon(Icons.archive)),
        ],
      ),
      body: buildLessonList(),
    );
  }

  buildLessonList() {
    return StreamBuilder(
      initialData: lessonBloc.getAll(),
      stream: lessonBloc.getStream,
      builder: (context, snapshot) {
        return snapshot.data.length > 0
            ? buildLessonItems(snapshot)
            : Center(
                child: Text("Data Yok"),
              );
      },
    );
  }

  buildLessonItems(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index) {
          final list = snapshot.data;
          return ListTile(
            title: Text(list[index].name),
            subtitle: Text("Kredisi: ${list[index].point.toString()}"),
            trailing: IconButton(
              onPressed: () {
                cartBloc.addToCart(Cart(list[index]));
                AlertDialog alertDialog = new AlertDialog(
                  title: Text("Ders Ekleme İşlemi"),
                  content: Text("Ders Başarıyla Eklendi."),
                );
                showDialog(context: context, builder: (_) => alertDialog);
              },
              icon: Icon(Icons.add),
            ),
          );
        });
  }
}
