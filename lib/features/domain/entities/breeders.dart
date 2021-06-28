class Breeders {
  final int userId;
  final String name;
  final double weight;
  final bool gender;
  final int age;
  final String? image;
  Breeders({
    required this.userId,
    required this.name,
    required this.weight,
    required this.gender,
    required this.age,
    this.image,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Breeders &&
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

  Breeders copyWith({
    int? userId,
    String? name,
    double? weight,
    bool? gender,
    int? age,
    String? image,
  }) {
    return Breeders(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      image: image ?? this.image,
    );
  }

  @override
  String toString() {
    return 'Breeders(userId: $userId, name: $name, weight: $weight, gender: $gender, age: $age, image: $image)';
  }
}
