import 'package:farmerlocalmobile/core/errors/exeptions.dart';
import 'package:farmerlocalmobile/database/app_database.dart';
import 'package:farmerlocalmobile/database/user/user_table.dart';
import 'package:moor/moor.dart';

part 'user_dao.g.dart';

@UseDao(
  tables: [Users],
)
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future register({
    required String email,
    required String password,
    required String name,
  }) =>
      into(users)
          .insert(
        UsersCompanion.insert(
          name: name,
          email: email,
          password: password,
          createdAt: DateTime.now(),
        ),
      )
          .onError((error, stackTrace) {
        print("REGISTER ERROR: $error,$stackTrace");
        throw DatabaseExeption();
      });

  Future<UserDataClass?> login({
    required String email,
    required String password,
  }) =>
      (select(users)
            ..where((tbl) => tbl.email.equals(email))
            ..where((tbl) => tbl.password.equals(password)))
          .getSingleOrNull()
          .onError((error, stackTrace) {
        print("LOGIN ERROR: $error,$stackTrace");
        throw DatabaseExeption();
      });

  Future<UserDataClass> getUser(int id) =>
      (select(users)..where((tbl) => tbl.id.equals(id)))
          .getSingle()
          .onError((error, stackTrace) {
        print("GET USER ERROR: $error,$stackTrace");
        throw DatabaseExeption();
      });
}
