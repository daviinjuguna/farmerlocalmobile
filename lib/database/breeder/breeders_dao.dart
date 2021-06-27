import 'package:farmerlocalmobile/database/app_database.dart';
import 'package:moor/moor.dart';

import 'breeders_table.dart';

part 'breeders_dao.g.dart';

@UseDao(tables: [Breeders])
class BreedersDao extends DatabaseAccessor<AppDatabase>
    with _$BreedersDaoMixin {
  BreedersDao(AppDatabase attachedDatabase) : super(attachedDatabase);
}
