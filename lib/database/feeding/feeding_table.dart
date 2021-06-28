import 'package:moor/moor.dart';

@DataClassName("FeedingDataClass")
class Feeding extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get dryMatter => real()();
  RealColumn get greenMatter => real()();
  BoolColumn get water => boolean()();
  DateTimeColumn get date => dateTime()();

  IntColumn get breeder => integer().customConstraint(
      'NOT NULL REFERENCES breeders (id) ON DELETE CASCADE')();
}
