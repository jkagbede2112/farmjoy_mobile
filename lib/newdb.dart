import 'dart:io';

import 'package:farmjoy/database_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class dbhelper {
  dbhelper._();
  static final dbhelper dbcon = dbhelper._();

  Database? _db;
  Future<Database?> get database async {
    _db ??= await _initializedb();
    return _db;
  }

  Future<Database> _initializedb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'db.db');
    return openDatabase('path', version: 1, onCreate: _oncreate);
  }

  Future _oncreate(Database db, int version) async {
    return db.query('''
    create table fruitlist(
    id integer primary key autoincrement,
    fruitname text not null,
    fruitprice text not null,
    fruitdescription text not null,
    shippable text not null,
    )
    ''');
  }

  //Insert Fruit
  Future<int> insert(Map<String, dynamic> fruit) async {
    Database? db = await dbcon.database;
    return await db!.insert('fruitlist', fruit);
  }

  //Delete Fruit
  Future<int> delete(int fruitid) async {
    Database? db = await dbcon.database;
    return db!.delete('fruitlist', where: 'id=?', whereArgs: [fruitid]);
  }

  //Update Fruit
  Future<int> update(Map<String, dynamic> fruit) async {
    Database? db = await dbcon.database;
    int fruitid = fruit['id'];
    return db!.update('fruitlist', fruit, where: 'id=?', whereArgs: [fruitid] );
  }

  //Read Fruit
  Future<List<Map<String, dynamic>>> read() async{
    Database? db = await dbcon.database;
    return db!.query('fruitlist');
  }
}
