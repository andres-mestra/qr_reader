import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/list_scans.dart';
import 'package:qr_reader/hooks/use_providers.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = UseProviders.scanListProvider(context);
    final scans = scanListProvider.scans;

    return ListScans(scans: scans, icon: Icons.location_on_outlined);
  }
}
