class Affirmation {
  final int? id;
  final String description;
  final String? categoryId;
  String? isFavorite;

  Affirmation({
    this.id,
    required this.description,
    required this.categoryId,
    required this.isFavorite,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'categoryId': categoryId,
      'isFavorite': isFavorite,
    };
  }

  factory Affirmation.fromMap(Map<String, dynamic> map) {
    return Affirmation(
      id: map['id'],
      description: map['description'],
      categoryId: map['categoryId'],
      isFavorite: map['isFavorite'],
    );
  }
}
