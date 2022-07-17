import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String typeSelect = 'http';

  newScan(String valor) async {
    final newScan = ScanModel(valor: valor);
    final id = await DBProvider.db.newScanInsert(newScan);
    // Assign id of model from db
    newScan.id = id;

    if (typeSelect == newScan.tipo) {
      scans.add(newScan);
      notifyListeners();
    }
  }

  loadScans() async {
    final respScans = await DBProvider.db.getScans();
    scans = [...respScans];
    notifyListeners();
  }

  loadScansForType(String type) async {
    final respScans = await DBProvider.db.whereScans('tipo', type);
    scans = [...respScans];
    typeSelect = type;
    notifyListeners();
  }

  deleteForId(int id) async {
    await DBProvider.db.deleteScan(id);
    scans = scans.where((s) => s.id != id).toList();
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }
}
