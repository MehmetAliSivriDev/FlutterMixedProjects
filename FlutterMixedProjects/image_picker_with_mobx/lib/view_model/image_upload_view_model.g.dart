// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_upload_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImageUploadViewModel on _ImageUploadViewModelBase, Store {
  late final _$animationControllerAtom = Atom(
      name: '_ImageUploadViewModelBase.animationController', context: context);

  @override
  AnimationController? get animationController {
    _$animationControllerAtom.reportRead();
    return super.animationController;
  }

  @override
  set animationController(AnimationController? value) {
    _$animationControllerAtom.reportWrite(value, super.animationController, () {
      super.animationController = value;
    });
  }

  late final _$downloadTextAtom =
      Atom(name: '_ImageUploadViewModelBase.downloadText', context: context);

  @override
  String get downloadText {
    _$downloadTextAtom.reportRead();
    return super.downloadText;
  }

  @override
  set downloadText(String value) {
    _$downloadTextAtom.reportWrite(value, super.downloadText, () {
      super.downloadText = value;
    });
  }

  late final _$sendAtom =
      Atom(name: '_ImageUploadViewModelBase.send', context: context);

  @override
  int get send {
    _$sendAtom.reportRead();
    return super.send;
  }

  @override
  set send(int value) {
    _$sendAtom.reportWrite(value, super.send, () {
      super.send = value;
    });
  }

  late final _$fileAtom =
      Atom(name: '_ImageUploadViewModelBase.file', context: context);

  @override
  File? get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(File? value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ImageUploadViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$targetAtom =
      Atom(name: '_ImageUploadViewModelBase.target', context: context);

  @override
  double? get target {
    _$targetAtom.reportRead();
    return super.target;
  }

  @override
  set target(double? value) {
    _$targetAtom.reportWrite(value, super.target, () {
      super.target = value;
    });
  }

  late final _$_ImageUploadViewModelBaseActionController =
      ActionController(name: '_ImageUploadViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_ImageUploadViewModelBaseActionController
        .startAction(name: '_ImageUploadViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_ImageUploadViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDownloadText(int send, int total) {
    final _$actionInfo = _$_ImageUploadViewModelBaseActionController
        .startAction(name: '_ImageUploadViewModelBase.updateDownloadText');
    try {
      return super.updateDownloadText(send, total);
    } finally {
      _$_ImageUploadViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateLottie(int send) {
    final _$actionInfo = _$_ImageUploadViewModelBaseActionController
        .startAction(name: '_ImageUploadViewModelBase.updateLottie');
    try {
      return super.updateLottie(send);
    } finally {
      _$_ImageUploadViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveLocal(XFile? file) {
    final _$actionInfo = _$_ImageUploadViewModelBaseActionController
        .startAction(name: '_ImageUploadViewModelBase.saveLocal');
    try {
      return super.saveLocal(file);
    } finally {
      _$_ImageUploadViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
animationController: ${animationController},
downloadText: ${downloadText},
send: ${send},
file: ${file},
isLoading: ${isLoading},
target: ${target}
    ''';
  }
}
