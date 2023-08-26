import 'dart:io';

import 'package:flutter_json_denemesi/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryApi {
  static Future getCategories() {
    return http.get(Uri.parse("http://localhost:3000/categories"));
  }
}
