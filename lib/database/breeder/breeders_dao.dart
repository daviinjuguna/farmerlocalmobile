import 'package:farmerlocalmobile/core/errors/exeptions.dart';
import 'package:farmerlocalmobile/database/app_database.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

import 'breeders_table.dart';

part 'breeders_dao.g.dart';

@UseDao(tables: [Breeders])
class BreedersDao extends DatabaseAccessor<AppDatabase>
    with _$BreedersDaoMixin {
  BreedersDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future addBreeders({
    required int userId,
    required String name,
    required double weight,
    required bool gender,
    required int age,
    required String? image,
  }) =>
      into(breeders)
          .insert(BreedersCompanion.insert(
        name: name,
        weight: weight,
        gender: gender,
        age: age,
        user: userId,
        image: Value(image ?? ""),
      ))
          .onError((error, stackTrace) {
        print("ERROR ADD BREEDER: $error,$stackTrace");
        throw DatabaseExeption();
      });

  Stream<List<BreedersDataClass>> watchBreeders(int userId) =>
      (select(breeders)..where((tbl) => tbl.user.equals(userId)))
          .watch()
          .onErrorReturnWith((error, stackTrace) {
        print("ERROR WATCH BREEDER: $error,$stackTrace");
        throw DatabaseExeption();
      });

  Future deleteBreeder(int id) =>
      (delete(breeders)..where((tbl) => tbl.id.equals(id)))
          .go()
          .onError((error, stackTrace) {
        print("ERROR DELETE BREEDERS: $error,$stackTrace");
        throw DatabaseExeption();
      });

  Future updateBreeders({
    required int id,
    required BreedersDataClass data,
  }) =>
      (update(breeders)..where((tbl) => tbl.id.equals(id)))
          .write(data)
          .onError((error, stackTrace) {
        print("ERROE EDIT BREEDER: $error,$stackTrace");
        throw DatabaseExeption();
      });

  Future<List<BreedersDataClass>> getOppGender(
          {required int userId, required bool gender}) =>
      (select(breeders)
            ..where((tbl) => tbl.user.equals(userId))
            ..where((tbl) => tbl.gender.equals(!gender)))
          .get()
          .onError((error, stackTrace) {
        print("ERROE GWT OPP GENDER BREEDER: $error,$stackTrace");
        throw DatabaseExeption();
      });
}
