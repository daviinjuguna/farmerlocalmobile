class User {
  final int id;
  final String name;
  final DateTime createdAt;
  User({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  User copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ createdAt.hashCode;

  @override
  String toString() => 'User(id: $id, name: $name, createdAt: $createdAt)';
}
