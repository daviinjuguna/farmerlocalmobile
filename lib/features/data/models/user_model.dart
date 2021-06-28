import 'package:farmerlocalmobile/features/domain/entities/user.dart';

class UserModel extends User {
  @override
  final int id;
  @override
  final String name;
  @override
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.createdAt,
  }) : super(id: id, name: name, createdAt: createdAt);

  UserModel copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ createdAt.hashCode;

  @override
  String toString() => 'UserModel(id: $id, name: $name, createdAt: $createdAt)';
}
