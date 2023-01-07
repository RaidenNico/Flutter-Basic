import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget {
  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  late MapboxMapController mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxMap(
        accessToken:
            "sk.eyJ1IjoicmFpZGVubmljbyIsImEiOiJjbGNsZmE5eG45a3ZzM25wbGo1dTEzOTl5In0.7aJixRWMU9-_QXW9nR6QcQ",
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
            target: LatLng(-11.967745156683534, -76.99607756309396)),
      ),
    );
  }
}
