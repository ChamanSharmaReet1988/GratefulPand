class Category {
  final int? id;
  final String title;
  final String? index;
  final String? isPremium;
  final String? image;
  final String? played;
  Category({
    this.id,
    required this.title,
    this.index,
    this.isPremium,
    this.image,
    this.played,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'categoryIndex': index,
      'isPremium': isPremium,
      'image': image,
      'played': played,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      title: map['title'],
      index: map['categoryIndex'],
      isPremium: map['isPremium'],
      image: map['image'],
      played: map['played'],
    );
  }
}
