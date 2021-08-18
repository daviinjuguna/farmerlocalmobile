import 'dart:io';

import 'package:farmerlocalmobile/core/errors/exeptions.dart';
import 'package:farmerlocalmobile/database/breeder/breeders_dao.dart';
import 'package:farmerlocalmobile/database/breeder/breeders_table.dart';
import 'package:farmerlocalmobile/database/breeding/breeding_dao.dart';
import 'package:farmerlocalmobile/database/breeding/breeding_table.dart';
import 'package:farmerlocalmobile/database/feeding/feeding_dao.dart';
import 'package:farmerlocalmobile/database/feeding/feeding_table.dart';
import 'package:injectable/injectable.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'user/user_dao.dart';
import 'user/user_table.dart';

part 'app_database.g.dart';

@UseMoor(
  tables: [Users, Breeders, Feeding, Breeding],
  daos: [UserDao, BreedersDao, FeedingDao, BreedingDao],
)
@lazySingleton
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection()) {
    moorRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  }

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (detailt) async =>
            await customStatement('PRAGMA foreign_keys = ON'),
        onCreate: (m) => m.createAll(),
      );
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getExternalStorageDirectory();
    if (dbFolder == null) throw DatabaseExeption();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}
