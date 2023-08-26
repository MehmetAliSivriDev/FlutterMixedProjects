import 'dart:convert';
import 'package:car_app/models/category.dart';
import 'package:flutter/material.dart';
import '../data/category_api.dart';
import 'package:flutter/services.dart' as rootBundle;

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  /*
  List<Category> categories = <Category>[];
  List<Widget> categoryWidgets = <Widget>[];

  @override
  void initState() {
    super.initState();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Araç-Alım Satım Uygulaması",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[futureCat],
          )),
    );
  }

/*
  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.categories =
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return TextButton(
      child: Text(
        category.categoryName!,
        style: TextStyle(color: Colors.black),
      ),
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
              side: BorderSide(color: Colors.black)))),
      onPressed: () {},
    );
  }
*/
  Widget get futureCat => FutureBuilder(
      future: CategoryApi.ReadJsonData(),
      builder: ((context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<Category>;
          return SizedBox(
            height: 45,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                      child: Text(
                        items[index].categoryName!,
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  side: BorderSide(color: Colors.black)))),
                      onPressed: () {},
                    );
                  }),
            ]),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }));
}

/*ElevatedButton.icon(
      label: Text(
        category.categoryName,
        style: TextStyle(color: Colors.white),
      ),
      icon: Icon(Icons.arrow_drop_down),
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
              side: BorderSide(color: Colors.black)))),
      onPressed: () {},*/

