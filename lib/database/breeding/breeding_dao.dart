import 'package:farmerlocalmobile/core/errors/exeptions.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

import 'package:farmerlocalmobile/database/app_database.dart';
import 'package:farmerlocalmobile/database/breeder/breeders_table.dart';
import 'package:farmerlocalmobile/database/breeding/breeding_table.dart';

part 'breeding_dao.g.dart';

@UseDao(tables: [Breeding, Breeders])
class BreedingDao extends DatabaseAccessor<AppDatabase>
    with _$BreedingDaoMixin {
  BreedingDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future insertBreeding(
          {required int kits, required int breeder, required int mate}) =>
      Future.wait([
        into(breeding)
            .insert(BreedingCompanion.insert(
                kit: kits, date: DateTime.now(), breeder: breeder, mate: mate))
            .onError((error, stackTrace) {
          print("ERROR INSERT BREEDING: $error,$stackTrace");
          throw DatabaseExeption();
        }),
        into(breeding)
            .insert(BreedingCompanion.insert(
                kit: kits, date: DateTime.now(), breeder: mate, mate: breeder))
            .onError((error, stackTrace) {
          print("ERROR INSERT BREEDING: $error,$stackTrace");
          throw DatabaseExeption();
        })
      ]);

  Stream<List<BreedingWithBreeder>> watchBreeding(int id) =>
      (select(breeding)..where((tbl) => tbl.breeder.equals(id)))
          .join([leftOuterJoin(breeders, breeders.id.equalsExp(breeding.mate))])
          .watch()
          .map((rows) => rows
              .map(
                (row) => BreedingWithBreeder(
                  breeding: row.readTable(breeding),
                  breeders: row.readTable(breeders),
                ),
              )
              .toList())
          .onErrorReturnWith((error, stackTrace) {
            print("ERROR WATCH BREEDING: $error,$stackTrace");
            throw DatabaseExeption();
          });

  Future deleteBreedin(int id) =>
      (delete(breeding)..where((tbl) => tbl.id.equals(id)))
          .go()
          .onError((error, stackTrace) {
        print("ERROR DELETE BREEDING: $error,$stackTrace");
        throw DatabaseExeption();
      });

  // Future editBreeding({required int id,required BreedingWithBreeder breedingWithBreeder})=>(select(breeding
  // ))
}

class BreedingWithBreeder {
  final BreedingDataClass breeding;
  final BreedersDataClass breeders;
  BreedingWithBreeder({
    required this.breeding,
    required this.breeders,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BreedingWithBreeder &&
        other.breeding == breeding &&
        other.breeders == breeders;
  }

  @override
  int get hashCode => breeding.hashCode ^ breeders.hashCode;

  BreedingWithBreeder copyWith({
    BreedingDataClass? breeding,
    BreedersDataClass? breeders,
  }) {
    return BreedingWithBreeder(
      breeding: breeding ?? this.breeding,
      breeders: breeders ?? this.breeders,
    );
  }

  @override
  String toString() =>
      'BreedingWithUser(breeding: $breeding, breeders: $breeders)';
}
