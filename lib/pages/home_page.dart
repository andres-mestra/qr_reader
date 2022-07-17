import 'package:flutter/material.dart';
import 'package:qr_reader/pages/pages.dart';
import 'package:qr_reader/widgets/widgets.dart';
import 'package:qr_reader/hooks/use_providers.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_forever),
          )
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = UseProviders.uiProvider(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    //Use ScanListPrivider
    final scanListProvider =
        UseProviders.scanListProvider(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansForType('geo');
        return const MapasPage();
      case 1:
        scanListProvider.loadScansForType('http');
        return const DireccionesPage();
      default:
        scanListProvider.loadScansForType('geo');
        return const MapasPage();
    }
  }
}
