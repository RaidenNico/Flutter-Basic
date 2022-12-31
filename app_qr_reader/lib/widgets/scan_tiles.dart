import 'package:app_qr_reader/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {
  const ScanTiles({Key? key, required this.tipo}) : super(key: key);

  final String tipo;

  @override
  Widget build(BuildContext context) {
    // liste -> cunado esta en un build va en true
    final scanlistProvider = Provider.of<ScanListProvider>(context);

    final scans = scanlistProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, index) => Dismissible(
        key: UniqueKey(), // genera un key
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) {
          scanlistProvider.borrarScanPorId(scans[index].id!);
        },
        child: ListTile(
          leading: Icon(
            tipo == 'http' ? Icons.home_outlined : Icons.map_outlined,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[index].valor),
          subtitle: Text('ID: ' + scans[index].id.toString()),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onTap: () => launchURL(context, scans[index]),
        ),
      ),
    );
  }
}
