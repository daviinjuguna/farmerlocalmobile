import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';

class BreedersModel extends Breeders {
  @override
  final int userId;
  @override
  final String name;
  @override
  final double weight;
  @override
  final bool gender;
  @override
  final int age;
  @override
  final String? image;

  BreedersModel({
    required this.userId,
    required this.name,
    required this.weight,
    required this.gender,
    required this.age,
    this.image,
  }) : super(
          userId: userId,
          name: name,
          weight: weight,
          gender: gender,
          age: age,
          image: image,
        );

  BreedersModel copyWith({
    int? userId,
    String? name,
    double? weight,
    bool? gender,
    int? age,
    String? image,
  }) {
    return BreedersModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      image: image ?? this.image,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BreedersModel &&
        other.userId == userId &&
        other.name == name &&
        other.weight == weight &&
        other.gender == gender &&
        other.age == age &&
        other.image == image;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        name.hashCode ^
        weight.hashCode ^
        gender.hashCode ^
        age.hashCode ^
        image.hashCode;
  }

  @override
  String toString() {
    return 'BreedersModel(userId: $userId, name: $name, weight: $weight, gender: $gender, age: $age, image: $image)';
  }
}
