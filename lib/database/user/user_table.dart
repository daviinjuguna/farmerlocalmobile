import 'package:moor/moor.dart';

@DataClassName("UserDataClass")
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get email => text().customConstraint("UNIQUE")();
  TextColumn get password => text()();
  DateTimeColumn get createdAt => dateTime()();
}
//* User is the same as farm
