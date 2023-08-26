import 'dart:convert';

import 'package:car_app/models/category.dart';
import "package:http/http.dart" as http;
import 'package:flutter/services.dart' as rootBundle;

class CategoryApi {
  static Future getCategories() {
    return http.get(Uri.parse("http://10.0.2.2:3000/categories"));
  }

  static Future<List<Category>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfile/carApp.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => Category.fromJson(e)).toList();
  }
}
