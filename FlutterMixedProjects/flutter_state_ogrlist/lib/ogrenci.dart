class Ogrenciler {
  late String adSoyad;
  late int sinif;
  late int id;
  Ogrenciler.withId(int id, String adSoyad, int sinif) {
    this.id = id;
    this.adSoyad = adSoyad;
    this.sinif = sinif;
  }

  Ogrenciler(int id, String adSoyad, int sinif) {
    this.adSoyad = adSoyad;
    this.sinif = sinif;
  }

  Ogrenciler.withOutInfo() {}
}
