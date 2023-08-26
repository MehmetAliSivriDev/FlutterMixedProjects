import 'package:flutter_e_ticaret_uygulamasi/models/Urun.dart';

class SepetService {
  static List<Urun> sepetListesi = <Urun>[];
  static SepetService _sepetSingleton = SepetService._internal();

  SepetService._internal();

  factory SepetService() {
    return _sepetSingleton;
  }

  static void sepeteEkle(Urun urun) {
    sepetListesi.add(urun);
  }

  static void sepettenSil(Urun urun) {
    sepetListesi.remove(urun);
  }

  static List<Urun> listeyiGetir() {
    return sepetListesi;
  }
}
