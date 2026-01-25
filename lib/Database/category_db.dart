import 'package:gratefull_panda/Database/db_helper.dart';
import 'package:gratefull_panda/Models/category.dart';

class CategoryDb {
  static final CategoryDb instance = CategoryDb._internal();
  factory CategoryDb() => instance;
  CategoryDb._internal();

  Future<int> insertCategory({required Category category}) async {
    final db = await DBHelper.instance.database;

    return await db.insert('CategoryTable', {
      'title': category.title,
      'categoryIndex': category.index,
      'isPremium': category.isPremium,
      'image': category.image,
    });
  }

  Future<List<Category>> getAllCategories() async {
    final db = await DBHelper.instance.database;

    final List<Map<String, dynamic>> result = await db.query(
      'CategoryTable',
      orderBy: 'categoryIndex ASC',
    );

    return result.map((e) => Category.fromMap(e)).toList();
  }

  Future<int> updateCategory(Category category) async {
    final db = await DBHelper.instance.database;
    return await db.update(
      'CategoryTable',
      category.toMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }
}
