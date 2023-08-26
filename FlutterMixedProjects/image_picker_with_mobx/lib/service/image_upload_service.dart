import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image_picker_with_mobx/model/image_upload_response.dart';

class ImageUploadService {
  final Dio dio;

  ImageUploadService(this.dio);

  Future<ImageUploadResponse?> uploadImageToServer(
      Uint8List byteArray, String name,
      {void Function(int, int)? onSendProgress}) async {
    final response = await dio.post(
      'Images%2F$name.png',
      data: byteArray,
      onSendProgress: onSendProgress,
    );

    if (response.statusCode == HttpStatus.ok) {
      return ImageUploadResponse.fromJson(response.data);
    }
    return null;
  }
}
