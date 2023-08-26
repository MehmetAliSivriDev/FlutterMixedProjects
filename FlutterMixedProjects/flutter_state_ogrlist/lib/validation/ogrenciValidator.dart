import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class OgrenciValidationMixin {
  String? validateAdSoyad(String value) {
    if (value.contains("0") ||
        value.contains("1") ||
        value.contains("2") ||
        value.contains("3") ||
        value.contains("4") ||
        value.contains("5") ||
        value.contains("6") ||
        value.contains("7") ||
        value.contains("8") ||
        value.contains("9")) {
      return "Karekter Girişini Doğru Yapınız!";
    } else if (value.length < 6) {
      return "Ad ve Soyad En Az 6 Karakter Olmalı!";
    }
  }

  String? validateSinif(String value) {
    var sinif = int.parse(value);
    if (sinif > 4 || sinif < 0) {
      return "1-4 Arasında Bir Sınıf Girilmeli!";
    }
  }
}
