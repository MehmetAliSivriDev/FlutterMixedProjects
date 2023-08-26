import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Map1 extends StatefulWidget {
  const Map1({super.key});

  @override
  State<Map1> createState() => _Map1State();
}

class _Map1State extends State<Map1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Application'),
      ),
      body: Stack(
        children: <Widget>[
          FlutterMap(
              options: MapOptions(
                  zoom: 100, minZoom: 10, center: LatLng(40.193298, 29.074202)),
              children: [
                TileLayer(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c']),
                MarkerLayer(markers: [
                  Marker(
                      width: 45.0,
                      height: 45.0,
                      point: LatLng(40.73, -74.00),
                      builder: (context) => Container(
                            child: IconButton(
                                icon: Icon(Icons.accessibility),
                                onPressed: () {
                                  print('Marker tapped!');
                                }),
                          ))
                ])
              ])
        ],
      ),
    );
  }
}
