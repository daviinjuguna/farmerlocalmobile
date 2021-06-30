import 'package:farmerlocalmobile/core/errors/exeptions.dart';
import 'package:farmerlocalmobile/database/app_database.dart';
import 'package:farmerlocalmobile/database/feeding/feeding_table.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

part 'feeding_dao.g.dart';

@UseDao(tables: [Feeding])
class FeedingDao extends DatabaseAccessor<AppDatabase> with _$FeedingDaoMixin {
  FeedingDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future insertFeeding({
    required int breederId,
    required double dryMatter,
    required double greenMatter,
    required bool water,
  }) =>
      into(feeding)
          .insert(FeedingCompanion.insert(
        dryMatter: dryMatter,
        greenMatter: greenMatter,
        water: water,
        date: DateTime.now(),
        breeder: breederId,
      ))
          .onError((error, stackTrace) {
        print("ERROR INSERT FEEDING: $error,$stackTrace");
        throw DatabaseExeption();
      });

  Stream<List<FeedingDataClass>> watchFeeding(int breederId) => (select(feeding)
            ..where((tbl) => tbl.breeder.equals(breederId))
            ..orderBy([(u) => OrderingTerm.desc(u.date)]))
          .watch()
          .onErrorReturnWith((error, stackTrace) {
        print("ERROR WATCH BREEDER: $error,$stackTrace");
        throw DatabaseExeption();
      });

  Future updateFeedint({
    required int id,
    required FeedingDataClass feed,
  }) =>
      (update(feeding)..where((tbl) => tbl.id.equals(id)))
          .write(feed.copyWith(date: DateTime.now()))
          .onError((error, stackTrace) {
        print("ERROR UPDATE FEEDING: $error,$stackTrace");
        throw DatabaseExeption();
      });

  Future deleteFeeding(int id) =>
      (delete(feeding)..where((tbl) => tbl.id.equals(id)))
          .go()
          .onError((error, stackTrace) {
        print("ERROR DELETE FEEDING: $error,$stackTrace");
        throw DatabaseExeption();
      });
}
