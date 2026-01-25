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
}
