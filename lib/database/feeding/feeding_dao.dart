import 'package:farmerlocalmobile/database/app_database.dart';
import 'package:farmerlocalmobile/database/feeding/feeding_table.dart';
import 'package:moor/moor.dart';

part 'feeding_dao.g.dart';

@UseDao(tables: [Feeding])
class FeedingDao extends DatabaseAccessor<AppDatabase> with _$FeedingDaoMixin {
  FeedingDao(AppDatabase attachedDatabase) : super(attachedDatabase);
}
