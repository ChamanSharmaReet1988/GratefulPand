import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  DBHelper._internal();
  static final DBHelper instance = DBHelper._internal();
  Database? _database;
  String dbName = 'gratefullpanda.db';
  int dbVersion = 1;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    if (kDebugMode) {
      print("DBPath: $dbPath");
    }
    return await openDatabase(path, version: dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE CategoryTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        categoryIndex TEXT,
        image TEXT,
        isPremium TEXT,
        played TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE AffirmationTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        description TEXT,
        categoryId TEXT,
        isFavorite TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE VisionTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE VisionDataTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        value TEXT,
        type TEXT, 
        visionId TEXT,
        color TEXT
      )
    ''');
  }
}
