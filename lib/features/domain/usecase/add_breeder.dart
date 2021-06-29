import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddBreeder extends UseCase<String, AddBreederParams> {
  AddBreeder(this._repository);

  @override
  Future<Either<String, String>> call(AddBreederParams p) {
    return _repository.addBreeder(
        name: p.name,
        weight: p.weight,
        gender: p.gender,
        age: p.age,
        image: p.image);
  }

  final Repository _repository;
}

class AddBreederParams {
  final String name;
  final double weight;
  final bool gender;
  final int age;
  final File image;
  AddBreederParams({
    required this.name,
    required this.weight,
    required this.gender,
    required this.age,
    required this.image,
  });

  AddBreederParams copyWith({
    String? name,
    double? weight,
    bool? gender,
    int? age,
    File? image,
  }) {
    return AddBreederParams(
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

    return other is AddBreederParams &&
        other.name == name &&
        other.weight == weight &&
        other.gender == gender &&
        other.age == age &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        weight.hashCode ^
        gender.hashCode ^
        age.hashCode ^
        image.hashCode;
  }

  @override
  String toString() {
    return 'AddBreederParams(name: $name, weight: $weight, gender: $gender, age: $age, image: ${image.path})';
  }
}
