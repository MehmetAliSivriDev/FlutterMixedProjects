import 'dart:io';

import 'package:bloc_usage/model/jplace_model.dart';
import 'package:dio/dio.dart';

abstract class JplaceRepository {
  Future<List<Jplace>> fetchData();
}

class SampleJplaceRepository implements JplaceRepository {
  final _baseUrl = "https://jsonplaceholder.typicode.com/posts";
  final _service = Dio();

  @override
  Future<List<Jplace>> fetchData() async {
    final response = await _service.get(_baseUrl);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = response.data;

        if (jsonBody is List) {
          return jsonBody.map((e) => Jplace.fromJson(e)).toList();
        } else {
          throw const CustomError("Json Body isnt a List.");
        }

      default:
        throw const CustomError("There Has Been Error.");
    }
  }
}

class CustomError implements Exception {
  final String message;
  const CustomError(this.message);
}
