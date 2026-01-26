import 'package:gratefull_panda/Database/db_helper.dart';

import 'package:gratefull_panda/Models/vision_data.dart';

class VisionDataDb {
  static final VisionDataDb instance = VisionDataDb._internal();
  VisionDataDb._internal();

  Future<int> insertVision(VisionData? initialVision) async {
    final db = await DBHelper.instance.database;

    return await db.insert('VisionDataTable', {
      'value': initialVision?.value,
      'type': initialVision?.type,
      'visionId': initialVision?.visionId,
      'color': initialVision?.color,
    });
  }

  Future<List<VisionData>> getVisionDataByVisionId(String visionId) async {
    final db = await DBHelper.instance.database;

    final List<Map<String, dynamic>> result = await db.query(
      'VisionDataTable',
      where: 'visionId = ?',
      whereArgs: [visionId],
      orderBy: 'id ASC',
    );
    return result.map((map) => VisionData.fromMap(map)).toList();
  }

  Future<List<VisionData>> getVisionCollageItems(String visionId) async {
    final db = await DBHelper.instance.database;

    final List<Map<String, dynamic>> result = await db.query(
      'VisionDataTable',
      where: 'visionId = ?',
      whereArgs: [visionId],
      orderBy: 'id ASC',
    );

    final allItems = result.map((e) => VisionData.fromMap(e)).toList();
    final images = allItems.where((e) => e.type == 'image').toList();
    final texts = allItems.where((e) => e.type == 'text').toList();

    int imgIndex = 0;
    int txtIndex = 0;

    List<VisionData> collage = [];
    final pattern = ['image', 'text', 'image', 'text'];

    for (final slot in pattern) {
      if (slot == 'image') {
        if (imgIndex < images.length) {
          collage.add(images[imgIndex++]);
        } else if (txtIndex < texts.length) {
          collage.add(texts[txtIndex++]);
        }
      } else {
        if (txtIndex < texts.length) {
          collage.add(texts[txtIndex++]);
        } else if (imgIndex < images.length) {
          collage.add(images[imgIndex++]);
        }
      }
      if (collage.length == 4) break;
    }
    return collage;
  }
}
