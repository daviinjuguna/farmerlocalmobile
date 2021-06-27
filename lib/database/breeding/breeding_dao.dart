import 'package:farmerlocalmobile/database/app_database.dart';
import 'package:farmerlocalmobile/database/breeding/breeding_table.dart';
import 'package:moor/moor.dart';

part 'breeding_dao.g.dart';

@UseDao(tables: [Breeding])
class BreedingDao extends DatabaseAccessor<AppDatabase>
    with _$BreedingDaoMixin {
  BreedingDao(AppDatabase attachedDatabase) : super(attachedDatabase);
}
