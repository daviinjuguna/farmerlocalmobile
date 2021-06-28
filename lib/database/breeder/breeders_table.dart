import 'package:moor/moor.dart';

@DataClassName("BreedersDataClass")
class Breeders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get weight => real()(); //* stores doubles
  BoolColumn get gender => boolean()();
  IntColumn get age => integer()();
  TextColumn get image => text().withDefault(const Constant(""))();

  //*foreign keys
  IntColumn get user => integer()
      .customConstraint('NOT NULL REFERENCES users (id) ON DELETE CASCADE')();
}
