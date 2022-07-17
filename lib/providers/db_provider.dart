import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:qr_reader/models/scan_model.dart';
export 'package:qr_reader/models/scan_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  //Return instance of DB
  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  // Create DB
  Future<Database> initDB() async {
    //Path db
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //dev path /home/{username}/.cache/Google/AndroidStudio2021.1/device-explorer/{emulator_name}/data/user/0/com.example.qr_reader/app_flutter/ScansDB.db
    final path = join(documentsDirectory.path, 'ScansDB.db');

    //Create db
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
      },
    );
  }

  Future<int> newScanRaw(ScanModel newScan) async {
    final id = newScan.id;
    final tipo = newScan.tipo;
    final valor = newScan.valor;

    final db = await database;

    final res = await db?.rawInsert('''
      INSERT INTO Scans( id, tipo, valor )
        VALUES( $id, '$tipo', '$valor')
    ''');

    return res!;
  }

  Future<int> newScanInsert(ScanModel newScan) async {
    final db = await database;
    final res = await db?.insert('Scans', newScan.toJson());
    return res!;
  }

  Future<int> updateScan(ScanModel scan) async {
    final db = await database;
    final res = await db
        ?.update('Scans', scan.toJson(), where: 'id = ?', whereArgs: [scan.id]);
    return res!;
  }

  Future<ScanModel?> getScandById(int id) async {
    final db = await database;
    final res = await db?.query('Scans', where: 'id = ?', whereArgs: [id]);
    res!;
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getScans() async {
    final db = await database;
    final res = await db?.query('Scans');
    res!;

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<List<ScanModel>?> whereScans(String key, String value) async {
    final db = await database;
    final res = await db?.query('Scans', where: '$key = ?', whereArgs: [value]);
    res!;

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }
}
