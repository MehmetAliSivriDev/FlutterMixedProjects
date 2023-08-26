import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import 'dijkstraAlgorithm.dart';

class Map2 extends StatefulWidget {
  const Map2({super.key});

  @override
  State<Map2> createState() => _Map2State();
}

class _Map2State extends State<Map2> {
  late MapZoomPanBehavior zoomPanBehavior;
  late List<MarkerModel> _markerData;
  late List<Widget> _iconsList;
  List<MapLatLng> _routePoints = [];

  @override
  void initState() {
    _markerData = [
      MarkerModel(41.20993, 29.97667),
      MarkerModel(40.4, 28.0),
      MarkerModel(40.209831, 28.97967),
      MarkerModel(40.209931, 28.97667),
    ];
    _iconsList = <Widget>[
      Icon(Icons.add_location),
      Icon(Icons.airplanemode_active),
      Icon(Icons.add_alarm),
      Icon(Icons.accessibility_new),
    ];

    zoomPanBehavior = MapZoomPanBehavior(zoomLevel: 15, maxZoomLevel: 15);
    super.initState();
  }

  List<MapLatLng> calculateRoute() {
    // Dijkstra Algoritması ile rota hesaplanıyor.
    var dijkstra = DijkstraAlgorithm();
    var graf = {
      'Paris': {'Londra': 1, 'New York': 6},
      'Londra': {'Paris': 1, 'New York': 5},
      'New York': {'Londra': 5, 'Paris': 6},
    };
    var maliyet = dijkstra.dijkstra(graf, 'Paris');

    // Rota noktaları hesaplanıyor.
    var routePoints = <MapLatLng>[];
    var currentPoint = 'New York';
    while (currentPoint != 'Paris') {
      routePoints.add(MapLatLng(40.209931, 28.97667));
      var neighbors = graf[currentPoint]!;
      var prevPoint = currentPoint;
      currentPoint = neighbors.keys.firstWhere(
        (e) => maliyet[e] == maliyet[prevPoint]! - neighbors[e]!,
      );
    }
    routePoints.add(
      MapLatLng(40.209831, 28.97967),
    );
    routePoints = routePoints.reversed.toList();

    return routePoints;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.red),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.75,
                child: Card(
                  elevation: 15,
                  child: SfMaps(
                    layers: [
                      MapTileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        initialFocalLatLng: MapLatLng(40.20993, 28.97667),
                        sublayers: [
                          MapCircleLayer.inverted(
                            circles: List<MapCircle>.generate(
                              1,
                              (int index) {
                                return MapCircle(
                                  center: MapLatLng(40.20993, 28.97667),
                                  radius: 200,
                                );
                              },
                            ).toSet(),
                            color: Colors.black.withOpacity(0.3),
                            strokeColor: Colors.red,
                            strokeWidth: 1,
                          ),
                          MapPolylineLayer(
                            polylines: List<MapPolyline>.generate(
                              1,
                              (int index) {
                                return MapPolyline(
                                  points: _routePoints,
                                  width: 4,
                                  color: Colors.red,
                                );
                              },
                            ).toSet(),
                          ),
                        ],
                        zoomPanBehavior: zoomPanBehavior,
                        initialMarkersCount: 4,
                        markerBuilder: (BuildContext context, int index) {
                          return MapMarker(
                            latitude: _markerData[index].latitude,
                            longitude: _markerData[index].longitude,
                            child: _iconsList[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _routePoints = calculateRoute();
                    });
                  },
                  child: Text("Yolu Çiz"))
            ],
          ),
        ),
      ),
    );
  }
}

class MarkerModel {
  final double latitude;
  final double longitude;
  MarkerModel(this.latitude, this.longitude);
}
