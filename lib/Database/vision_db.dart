import 'package:gratefull_panda/Database/db_helper.dart';
import 'package:gratefull_panda/Models/vision.dart';
import 'package:sqflite/sqflite.dart';

class VisionDb {
  static final VisionDb instance = VisionDb._internal();
  VisionDb._internal();

  Future<Vision> insertVision({required Vision vision}) async {
    final db = await DBHelper.instance.database;
    final id = await db.insert('VisionTable', {
      'name': vision.name,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
    return Vision(id: id, name: vision.name);
  }

  Future<int> updateVision(Vision vision) async {
    final db = await DBHelper.instance.database;
    return await db.update(
      'VisionTable',
      {'name': vision.name},
      where: 'id = ?',
      whereArgs: [vision.id],
    );
  }

  Future<List<Vision>> getFirstTwoVisions() async {
    final db = await DBHelper.instance.database;
    final List<Map<String, dynamic>> result = await db.query(
      'VisionTable',
      orderBy: 'id ASC',
      limit: 2,
    );

    return result
        .map((map) => Vision(id: map['id'], name: map['name']))
        .toList();
  }

  Future<List<Vision>> getAllVisionsAfterTwo() async {
    final db = await DBHelper.instance.database;

    final List<Map<String, dynamic>> result = await db.query(
      'VisionTable',
      orderBy: 'id ASC',
      offset: 2, // 👈 skip first two
    );

    return result
        .map((map) => Vision(id: map['id'], name: map['name']))
        .toList();
  }
}
