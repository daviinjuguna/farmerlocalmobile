part of 'breeders_bloc.dart';

@immutable
abstract class BreedersEvent {}

class AddBreedersEvent extends BreedersEvent {
  final String name;
  final double weight;
  final bool gender;
  final int age;
  final File image;
  AddBreedersEvent({
    required this.name,
    required this.weight,
    required this.gender,
    required this.age,
    required this.image,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddBreedersEvent &&
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

  AddBreedersEvent copyWith({
    String? name,
    double? weight,
    bool? gender,
    int? age,
    File? image,
  }) {
    return AddBreedersEvent(
      name: name ?? this.name,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      image: image ?? this.image,
    );
  }

  @override
  String toString() {
    return 'AddBreedersEvent(name: $name, weight: $weight, gender: $gender, age: $age, image: $image)';
  }
}

class DeleteBreederEvent extends BreedersEvent {
  final int id;
  DeleteBreederEvent({
    required this.id,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DeleteBreederEvent && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'DeleteBreederEvent(id: $id)';
}

class UpdateBreederEvent extends BreedersEvent {
  final int id;
  final Breeders breeders;
  final File? image;
  UpdateBreederEvent({
    required this.id,
    required this.breeders,
    this.image,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpdateBreederEvent &&
        other.id == id &&
        other.breeders == breeders &&
        other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ breeders.hashCode ^ image.hashCode;

  @override
  String toString() =>
      'UpdateBreederEvent(id: $id, breeders: $breeders, image: $image)';
}
