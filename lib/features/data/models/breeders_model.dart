import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';

class BreedersModel extends Breeders {
  @override
  final int id;
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
    required this.id,
    required this.name,
    required this.weight,
    required this.gender,
    required this.age,
    this.image,
  }) : super(
          id: id,
          name: name,
          weight: weight,
          gender: gender,
          age: age,
          image: image,
        );

  BreedersModel copyWith({
    int? id,
    String? name,
    double? weight,
    bool? gender,
    int? age,
    String? image,
  }) {
    return BreedersModel(
      id: id ?? this.id,
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
        other.id == id &&
        other.name == name &&
        other.weight == weight &&
        other.gender == gender &&
        other.age == age &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        weight.hashCode ^
        gender.hashCode ^
        age.hashCode ^
        image.hashCode;
  }

  @override
  String toString() {
    return 'BreedersModel(id: $id, name: $name, weight: $weight, gender: $gender, age: $age, image: $image)';
  }
}
