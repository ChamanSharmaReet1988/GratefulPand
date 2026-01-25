class Vision {
  final int? id;
  String name;

  Vision({this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  factory Vision.fromMap(Map<String, dynamic> map) {
    return Vision(id: map['id'], name: map['name']);
  }
}
