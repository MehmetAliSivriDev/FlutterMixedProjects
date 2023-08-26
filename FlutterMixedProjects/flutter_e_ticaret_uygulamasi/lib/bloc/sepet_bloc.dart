import 'dart:async';

import 'package:flutter_e_ticaret_uygulamasi/db/sepet_service.dart';
import 'package:flutter_e_ticaret_uygulamasi/models/Urun.dart';

class SepetBloc {
  final sepetStreamController = StreamController.broadcast();

  Stream get getStream => sepetStreamController.stream;

  void sepeteEkle(Urun urun) {
    SepetService.sepeteEkle(urun);
    sepetStreamController.sink.add(SepetService.listeyiGetir());
  }

  void sepettenSil(Urun urun) {
    SepetService.sepettenSil(urun);
    sepetStreamController.sink.add(SepetService.listeyiGetir());
  }

  List<Urun> listeyiGetir() {
    return SepetService.listeyiGetir();
  }
}

final sepetBloc = SepetBloc();
