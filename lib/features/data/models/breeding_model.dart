import 'package:farmerlocalmobile/features/data/models/breeders_model.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeding.dart';

class BreedingModel extends Breeding {
  final int id;
  final int kit;
  final DateTime date;
  final int breeder;
  final BreedersModel mate;
  BreedingModel({
    required this.id,
    required this.kit,
    required this.date,
    required this.breeder,
    required this.mate,
  })  : assert(breeder != mate.id),
        super(
          breeder: breeder,
          id: id,
          kit: kit,
          date: date,
          mate: mate,
        );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BreedingModel &&
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
    return 'BreedingModel(id: $id, kit: $kit, date: $date, breeder: $breeder, mate: $mate)';
  }
}
