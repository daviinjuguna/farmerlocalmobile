import 'package:moor/moor.dart';

@DataClassName("BreedingDataClass")
class Breeding extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get kit => integer()();
  DateTimeColumn get date => dateTime()();

  IntColumn get breeder =>
      integer().customConstraint('NOT NULL REFERENCES breeders (id)')();
  IntColumn get mate =>
      integer().nullable().customConstraint('NULL REFERENCES breeders (id)')();
}
