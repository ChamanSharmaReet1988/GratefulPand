import 'package:gratefull_panda/Database/db_helper.dart';
import 'package:gratefull_panda/Models/affirmation.dart';
import 'package:sqflite/sqflite.dart';

class AffirmationDb {
  static final AffirmationDb instance = AffirmationDb._internal();
  factory AffirmationDb() => instance;
  AffirmationDb._internal();

  Future<int> insertAffirmation({required Affirmation affirmation}) async {
    final db = await DBHelper.instance.database;

    return await db.insert('AffirmationTable', {
      'description': affirmation.description,
      'categoryId': affirmation.categoryId,
      'isFavorite': affirmation.isFavorite,
    });
  }

  Future<int> getAffirmationCountByCategoryId(int categoryId) async {
    final db = await DBHelper.instance.database;

    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM AffirmationTable WHERE categoryId = ?',
      [categoryId],
    );

    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<List<Affirmation>> getAffirmationsByCategoryId(int categoryId) async {
    final db = await DBHelper.instance.database;

    final result = await db.query(
      'AffirmationTable',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
      orderBy: 'id ASC',
    );

    return result.map((e) => Affirmation.fromMap(e)).toList();
  }

  Future<void> updateFavorite(int affirmationId, String isFavorite) async {
    final db = await DBHelper.instance.database;

    await db.update(
      'AffirmationTable',
      {'isFavorite': isFavorite},
      where: 'id = ?',
      whereArgs: [affirmationId],
    );
  }

  Future<List<Affirmation>> getFavAffirmations() async {
    final db = await DBHelper.instance.database;

    final result = await db.query(
      'AffirmationTable',
      where: 'isFavorite = ?',
      whereArgs: ["1"],
      orderBy: 'id ASC',
    );

    return result.map((e) => Affirmation.fromMap(e)).toList();
  }

  Future<List<Affirmation>> getAffirmationsByCategoryLimit(
    int categoryId,
    int limit,
  ) async {
    final db = await DBHelper.instance.database;

    final result = await db.query(
      'AffirmationTable',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
      limit: limit,
      orderBy: 'RANDOM()',
    );

    return result.map((e) => Affirmation.fromMap(e)).toList();
  }

  Future<List<Affirmation>> getMyAffirmations() async {
    final db = await DBHelper.instance.database;

    final result = await db.query(
      'AffirmationTable',
      where: 'categoryId = ?',
      whereArgs: ["my"],
      orderBy: 'id ASC',
    );

    return result.map((e) => Affirmation.fromMap(e)).toList();
  }
}
