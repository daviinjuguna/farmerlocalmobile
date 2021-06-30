part of 'breeding_bloc.dart';

@immutable
abstract class BreedingEvent {}

class AddBreedingEvent extends BreedingEvent {
  final int kits;
  final int breeder;
  final int mate;
  AddBreedingEvent({
    required this.kits,
    required this.breeder,
    required this.mate,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddBreedingEvent &&
        other.kits == kits &&
        other.breeder == breeder &&
        other.mate == mate;
  }

  @override
  int get hashCode => kits.hashCode ^ breeder.hashCode ^ mate.hashCode;

  @override
  String toString() =>
      'AddBreedingEvent(kits: $kits, breeder: $breeder, mate: $mate)';
}

class DeleteBreedingEvent extends BreedingEvent {
  final int id;
  DeleteBreedingEvent({
    required this.id,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DeleteBreedingEvent && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'DeleteBreedingEvent(id: $id)';
}
