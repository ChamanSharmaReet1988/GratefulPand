import 'package:gratefull_panda/Common/data_source.dart';
import 'package:gratefull_panda/Database/db_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

Future<void> syncInitialDataToDB() async {
  // Sync initial categories and affirmations to the database
  final alreadyAdded = await hasAnyCategory();
  if (alreadyAdded) {
    return;
  }
  final db = await DBHelper.instance.database;

  await db.transaction((txn) async {
    for (final category in categories) {
      final int categoryId = await txn.insert('CategoryTable', {
        'title': category['category'],
        'categoryIndex': category['index'],
        'image': category['image'],
        'isPremium': category['isPremium'],
        'played': "0",
      }, conflictAlgorithm: ConflictAlgorithm.replace);

      final List affirmations = category['affirmations'];

      for (final affirmation in affirmations) {
        await txn.insert('AffirmationTable', {
          'categoryId': categoryId,
          'description': affirmation,
          'isFavorite': "0",
        });
      }
    }
  });

  // Sync vision to the database
  await db.transaction((txn) async {
    for (final vision in visionExamples) {
      final int visionId = await txn.insert('VisionTable', {
        'name': vision['exampleName'],
      }, conflictAlgorithm: ConflictAlgorithm.replace);

      final List visionDataArray = vision['items'];

      int i = 0;
      for (final visionData in visionDataArray) {
        await txn.insert('VisionDataTable', {
          'visionId': visionId,
          'type': visionData['type'],
          'value': visionData.containsKey('url')
              ? visionData['url']
              : visionData["text"],
          'color': visionColors[i].value.toRadixString(16),
        });
        if (i > 5) {
          i = 0;
        } else {
          i++;
        }
      }
    }
  });
}

Future<bool> hasAnyCategory() async {
  final db = await DBHelper.instance.database;

  final result = await db.rawQuery(
    'SELECT COUNT(*) as count FROM CategoryTable',
  );

  final count = Sqflite.firstIntValue(result) ?? 0;
  return count > 0;
}

class AppPaths {
  static late String documentsDir;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    documentsDir = dir.path;
  }
}
