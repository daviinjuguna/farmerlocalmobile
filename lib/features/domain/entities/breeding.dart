import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';

class Breeding {
  final int id;
  final int kit;
  final DateTime date;
  final int breeder;
  final Breeders mate;

  Breeding({
    required this.id,
    required this.kit,
    required this.date,
    required this.breeder,
    required this.mate,
  }) : assert(breeder != mate.id);

  Breeding copyWith({
    int? id,
    int? kit,
    DateTime? date,
    int? breeder,
    Breeders? mate,
  }) {
    return Breeding(
      id: id ?? this.id,
      kit: kit ?? this.kit,
      date: date ?? this.date,
      breeder: breeder ?? this.breeder,
      mate: mate ?? this.mate,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Breeding &&
        other.id == id &&
        other.kit == kit &&
        other.date == date &&
        other.breeder == breeder &&
        other.mate == mate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        kit.hashCode ^
        date.hashCode ^
        breeder.hashCode ^
        mate.hashCode;
  }

  @override
  String toString() {
    return 'Breeding(id: $id, kit: $kit, date: $date, breeder: $breeder, mate: $mate)';
  }
}
