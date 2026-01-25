class VisionData {
  final int? id;
  String? value;
  String? type;
  String? color;
  String? visionId;
  VisionData({this.id, this.value, this.type, this.color, this.visionId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
      'type': type,
      'color': color,
      'visionId': visionId,
    };
  }

  factory VisionData.fromMap(Map<String, dynamic> map) {
    return VisionData(
      id: map['id'],
      value: map['value'],
      type: map['type'],
      color: map['color'],
      visionId: map['visionId'],
    );
  }
}
