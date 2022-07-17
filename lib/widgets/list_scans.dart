import 'package:flutter/material.dart';
import 'package:qr_reader/models/models.dart';

class ListScans extends StatelessWidget {
  final IconData icon;
  final List<ScanModel> scans;

  const ListScans({Key? key, required this.scans, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => ListTile(
        title: Text(scans[i].valor),
        subtitle: Text('ID: ${scans[i].id}'),
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        onTap: () => print(scans[i].id),
      ),
    );
  }
}
