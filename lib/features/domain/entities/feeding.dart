class Feeding {
  final int id;
  final double dryMatter;
  final double greenMatter;
  final bool water;
  final DateTime date;
  final int breeder;
  Feeding({
    required this.id,
    required this.dryMatter,
    required this.greenMatter,
    required this.water,
    required this.date,
    required this.breeder,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Feeding &&
        other.id == id &&
        other.dryMatter == dryMatter &&
        other.greenMatter == greenMatter &&
        other.water == water &&
        other.date == date &&
        other.breeder == breeder;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        dryMatter.hashCode ^
        greenMatter.hashCode ^
        water.hashCode ^
        date.hashCode ^
        breeder.hashCode;
  }

  Feeding copyWith({
    int? id,
    double? dryMatter,
    double? greenMatter,
    bool? water,
    DateTime? date,
    int? breeder,
  }) {
    return Feeding(
      id: id ?? this.id,
      dryMatter: dryMatter ?? this.dryMatter,
      greenMatter: greenMatter ?? this.greenMatter,
      water: water ?? this.water,
      date: date ?? this.date,
      breeder: breeder ?? this.breeder,
    );
  }

  @override
  String toString() {
    return 'Feeding(id: $id, dryMatter: $dryMatter, greenMatter: $greenMatter, water: $water, date: $date, breeder: $breeder)';
  }
}
