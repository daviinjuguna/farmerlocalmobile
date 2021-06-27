import 'package:farmerlocalmobile/core/errors/exeptions.dart';
import 'package:farmerlocalmobile/core/utils/constants.dart';
import 'package:farmerlocalmobile/database/app_database.dart';
import 'package:farmerlocalmobile/features/data/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<bool> storeUserToCache(UserModel user);
  Future<int?> getStoredUser();
  Future<bool> clearPrefs();

  Future register({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel?> login({
    required String email,
    required String password,
  });

  Future<UserModel> getUser(int id);
}

@LazySingleton(as: LocalDataSource)
class Local implements LocalDataSource {
  final AppDatabase _db;
  final SharedPreferences _prefs;

  Local(this._db, this._prefs);

  @override
  Future<bool> storeUserToCache(UserModel user) async {
    try {
      return await _prefs.setInt(USER_ID, user.id);
    } catch (e) {
      print(e);
      throw CacheExeption();
    }
  }

  @override
  Future<bool> clearPrefs() async {
    try {
      return await _prefs.clear();
    } catch (e) {
      print(e);
      throw CacheExeption();
    }
  }

  @override
  Future<int?> getStoredUser() async {
    try {
      return Future.value(_prefs.getInt(USER_ID));
    } catch (e) {
      print(e);
      throw CacheExeption();
    }
  }

  @override
  Future register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _db.userDao.register(email: email, password: password, name: name);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<UserModel?> login(
      {required String email, required String password}) async {
    try {
      final _user = await _db.userDao.login(email: email, password: password);
      if (_user != null)
        return UserModel(
          id: _user.id,
          name: _user.name,
          createdAt: _user.createdAt,
        );
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<UserModel> getUser(int id) async {
    try {
      final _user = await _db.userDao.getUser(id);
      return UserModel(
        id: _user.id,
        name: _user.name,
        createdAt: _user.createdAt,
      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
