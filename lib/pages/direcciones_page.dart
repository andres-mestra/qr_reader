import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/list_scans.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListScans(icon: Icons.language_outlined);
  }
}
