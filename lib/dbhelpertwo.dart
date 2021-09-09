import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class databasehelper{
  databasehelper._();
  static final databasehelper dbcon = databasehelper._();

  static Database? _db;
  Future<Database?> get database async{
    _db ??= await _initiatedbcreate();
  }

  Future<Database> _initiatedbcreate() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "ariks.db";
    return openDatabase(path,version: 1, onCreate: _oncreate);
  }

  Future _oncreate(Database db, int version){
    return db.execute('''
    CREATE TABLE Login(
    id integer primary key,
    username text not null,
    password text not null,
    )
    ''');
  }

  Future<List<Map<String, dynamic>>> readlogin() async{
    Database? db = await dbcon.database;
    List<Map<String, dynamic>> result = await db!.query('SUPPLIERS');
    return result;
  }

}