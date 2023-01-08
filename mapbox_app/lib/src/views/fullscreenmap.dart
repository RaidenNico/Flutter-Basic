import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: unnecessary_import
import 'dart:typed_data';

class FullScreenMap extends StatefulWidget {
  const FullScreenMap({super.key});

  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  late MapboxMapController mapController;
  final center = const LatLng(-11.967745156683534, -76.99607756309396);
  String selectedStyle = "mapbox://styles/raidennico/clcmn8d2j008q14pae3rbz92o";
  final sateliteStyle = "mapbox://styles/raidennico/clcmn8d2j008q14pae3rbz92o";
  final streetStyle = "mapbox://styles/raidennico/clcmd4o2a008o14paf96vlfl1";
  final navigationStyle =
      "mapbox://styles/raidennico/clcmn7xbl00b515qsyov8doir";
  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    _onStyleLoaded();
  }

  void _onStyleLoaded() {
    addImageFromAsset("assetImage", "assets/custom-icon.png");
    addImageFromUrl("networkImage", "https://via.placeholder.com/50");
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController.addImage(name, list);
  }

  /// Adds a network image to the currently displayed style
  Future<void> addImageFromUrl(String name, String url) async {
    var response = await http.get(Uri.parse(url));
    return mapController.addImage(name, response.bodyBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: crearMapa(),
      floatingActionButton: botonesFlotantes(),
    );
  }

  Column botonesFlotantes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        //! Símbolos
        FloatingActionButton(
            child: const Icon(Icons.add_location_alt_outlined),
            onPressed: () {
              mapController.addSymbol(SymbolOptions(
                  geometry: center,
                  //iconSize: 3,
                  iconImage: 'networkImage',
                  textField: 'Ubicacion creada aquí',
                  textOffset: const Offset(0, 2)));
            }),

        const SizedBox(height: 5),

        //! ZoomInt
        FloatingActionButton(
            child: const Icon(Icons.zoom_in),
            onPressed: () {
              mapController.animateCamera(CameraUpdate.zoomIn());
            }),

        const SizedBox(height: 5),

        //! ZoomOut
        FloatingActionButton(
            child: const Icon(Icons.zoom_out),
            onPressed: () {
              mapController.animateCamera(CameraUpdate.zoomOut());
            }),

        const SizedBox(height: 5),

        //! Cambiar Estilos
        FloatingActionButton(
            child: const Icon(Icons.add_to_home_screen),
            onPressed: () {
              if (selectedStyle == sateliteStyle) {
                selectedStyle == streetStyle;
              } else {
                selectedStyle = sateliteStyle;
              }
              setState(() {});
            })
      ],
    );
  }

  MapboxMap crearMapa() {
    return MapboxMap(
      accessToken:
          "sk.eyJ1IjoicmFpZGVubmljbyIsImEiOiJjbGNsZmE5eG45a3ZzM25wbGo1dTEzOTl5In0.7aJixRWMU9-_QXW9nR6QcQ",
      styleString: selectedStyle,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: center, zoom: 15),
    );
  }
}
