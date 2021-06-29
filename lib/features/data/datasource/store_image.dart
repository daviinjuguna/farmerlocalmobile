import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

abstract class StoreImage {
  Future<String> storeImage(File imagePath);
}

@LazySingleton(as: StoreImage)
class StoreImageImpl implements StoreImage {
  @override
  Future<String> storeImage(File imagePath) async {
    try {
      final _dir = await getApplicationDocumentsDirectory();
      late final _basename = p.basename(imagePath.path);
      late final _path = p.join(_dir.path, _basename);
      final File _newPath = await imagePath.copy(_path);
      return _newPath.path;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
