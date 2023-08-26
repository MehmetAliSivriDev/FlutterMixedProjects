import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_with_mobx/service/image_upload_service.dart';
import 'package:mobx/mobx.dart';
part 'image_upload_view_model.g.dart';

class ImageUploadViewModel = _ImageUploadViewModelBase
    with _$ImageUploadViewModel;

abstract class _ImageUploadViewModelBase with Store {
  static const String _baseUrl =
      'https://firebasestorage.googleapis.com/v0/b/firabase-image-upload.appspot.com/o/';

  ImageUploadService _imageUploadService =
      ImageUploadService(Dio(BaseOptions(baseUrl: _baseUrl)));

  @observable
  AnimationController? animationController;

  @observable
  String downloadText = '';

  @observable
  int send = 0;

  @observable
  File? file;

  @observable
  bool isLoading = false;

  @observable
  double? target;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void updateDownloadText(int send, int total) {
    downloadText = '$send / $total';
  }

  @action
  void updateLottie(int send) {
    this.send = send;
  }

  void init() {}

  @action
  void saveLocal(XFile? file) {
    if (file == null) return;
    this.file = File(file.path);
  }

  Future<void> saveDataToService() async {
    if (file == null) return;
    changeLoading();
    _imageUploadService.uploadImageToServer(
      await file!.readAsBytes(),
      "newPhoto3",
      onSendProgress: (send, total) {
        updateDownloadText(send, total);
        updateLottie(send);
      },
    );
    changeLoading();
  }
}
