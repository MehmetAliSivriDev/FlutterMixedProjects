import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class DijkstraAlgorithm {
  Map<String, int> dijkstra(
      Map<String, Map<String, int>> graf, String baslangic) {
    // Başlangıç düğümüne maliyet sıfır olarak atanır
    var maliyet = Map<String, int>.fromIterable(
      graf.keys,
      value: (_) => 100,
    );
    maliyet[baslangic] = 0;

    // Daha önce ziyaret edilmeyen düğümleri heap'e ekleyin
    var heap = PriorityQueue<Tuple2<int, String>>(
      (a, b) => a.item1.compareTo(b.item1),
    );
    heap.add(Tuple2<int, String>(0, baslangic));

    while (heap.isNotEmpty) {
      var aktif = heap.removeFirst().item2;

      // Düğümün komşularını gezin
      for (var komsu in graf[aktif]!.keys) {
        var yeniMaliyet = maliyet[aktif]! + graf[aktif]![komsu]!;

        // Daha düşük bir maliyet bulunduysa, bunu kaydet ve heap'e ekleyin
        if (yeniMaliyet < maliyet[komsu]!) {
          maliyet[komsu] = yeniMaliyet;
          heap.add(Tuple2<int, String>(yeniMaliyet, komsu));
        }
      }
    }

    return maliyet;
  }
}

class Tuple2<T1, T2> {
  final T1 item1;
  final T2 item2;
  Tuple2(this.item1, this.item2);
}
