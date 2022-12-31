import 'package:app_qr_reader/models/scan_model.dart';
import 'package:app_qr_reader/providers/scan_list_provider.dart';
import 'package:app_qr_reader/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);

        //const barcodeScanRes = 'https://fernando-herrera.com';
        //const barcodeScanRes = 'geo:-12.06461594440853, -77.04096635371523';

        if (barcodeScanRes == '-1') return;

        final scanlistProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        ScanModel scanModel = await scanlistProvider.nuevoScan(barcodeScanRes);

        launchURL(context, scanModel);
      },
    );
  }
}
