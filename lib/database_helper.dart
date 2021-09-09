import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class dbhelper{
  dbhelper._instance();
  static final dbhelper dbcon = dbhelper._instance();

  static Database? _db;
  Future<Database?> get database async{
    _db ??= await _getdbinstance();
    return _db;
  }

  Future<Database> _getdbinstance() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'ariyike.db');
    return openDatabase(path, version: 1, onCreate: _oncreate);
  }

  Future _oncreate(Database db, int version){
    return db.execute(
      '''
      CREATE TABLE SUPPLIERS(
      ID INTEGER PRIMARY KEY AUTOINCREMENT,
      NAME TEXT NOT NULL,
      ADDRESS TEXT NOT NULL,
      PHONE TEXT NOT NULL,
      CAC TEXT NOT NULL
      )
      '''
    );
  }

  Future<int> savesupplier(Map<String, dynamic> suppliermap) async{
    Database? db = await dbcon.database;
    int result = await db!.insert('SUPPLIERS', suppliermap);
    return result;
  }

  Future<List<Map<String, dynamic>>> readsupplier() async{
    Database? db = await dbcon.database;
    List<Map<String, dynamic>> result = await db!.query('SUPPLIERS');
    return result;
  }

  Future<int> updatesupplier(Map<String, dynamic> suppliermap) async{
    Database? db = await dbcon.database;
    int id = suppliermap['ID'];
    int result = await db!.update('SUPPLIERS', suppliermap, where: 'id = ?', whereArgs:[id] );
    return result;
  }

  Future<int> deletesupplier(int id) async{
    Database? db = await dbcon.database;
    int result = await db!.delete('SUPPLIERS', where: 'id = ?', whereArgs:[id] );
    return result;
  }
}