import 'package:flutter/material.dart';
import 'package:qr_reader/hooks/use_providers.dart';

class ListScans extends StatelessWidget {
  final IconData icon;

  const ListScans({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = UseProviders.scanListProvider(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) {
          UseProviders.scanListProvider(context, listen: false)
              .deleteForId(scans[i].id!);
        },
        child: ListTile(
          title: Text(scans[i].valor),
          subtitle: Text('ID: ${scans[i].id}'),
          leading: Icon(icon, color: Theme.of(context).primaryColor),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => print(scans[i].id),
        ),
      ),
    );
  }
}
