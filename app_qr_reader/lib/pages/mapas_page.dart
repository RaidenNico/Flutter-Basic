import 'package:flutter/material.dart';

import '../widgets/scan_tiles.dart';

// ignore: use_key_in_widget_constructors
class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // liste -> cunado esta en un build va en true
    return const ScanTiles(
      tipo: 'http',
    );
  }
}
