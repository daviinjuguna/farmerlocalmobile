import 'package:moor/moor.dart';

@DataClassName("BreedingDataClass")
class Breeding extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get kit => integer()();
  DateTimeColumn get date => dateTime()();

  IntColumn get breeder => integer().customConstraint(
      'NOT NULL REFERENCES breeders (id) ON DELETE CASCADE')();
  IntColumn get mate =>
      integer().customConstraint('NOT NULL REFERENCES breeders (id)')();
}
