class NameItem {
  final String id;
  final String name;
  final DateTime createdAt;

  NameItem({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory NameItem.fromJson(Map<String, dynamic> json) {
    return NameItem(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}