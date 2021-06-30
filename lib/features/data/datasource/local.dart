import 'package:farmerlocalmobile/core/errors/exeptions.dart';
import 'package:farmerlocalmobile/core/utils/constants.dart';
import 'package:farmerlocalmobile/database/app_database.dart';
import 'package:farmerlocalmobile/features/data/models/breeders_model.dart';
import 'package:farmerlocalmobile/features/data/models/feeding_model.dart';
import 'package:farmerlocalmobile/features/data/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

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

  Future insertBreeders({
    required int userId,
    required String name,
    required double weight,
    required bool gender,
    required int age,
    required String? image,
  });

  //*BREEDERS ANIMALS
  Stream<List<BreedersModel>> watchBreeders(int userId);
  Future updateBreeder({
    required int id,
    required BreedersModel e,
    required int userId,
  });
  Future deleteBreeder(int id);

  //*FEEDING
  Future insertFeeding({
    required int breederId,
    required double dryMatter,
    required double greenMatter,
    required bool water,
  });
  Stream<List<FeedingModel>> watchFeeding(int breederId);
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

  @override
  Future insertBreeders({
    required int userId,
    required String name,
    required double weight,
    required bool gender,
    required int age,
    required String? image,
  }) async {
    try {
      await _db.breedersDao.addBreeders(
          userId: userId,
          name: name,
          weight: weight,
          gender: gender,
          age: age,
          image: image);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Stream<List<BreedersModel>> watchBreeders(int userId) async* {
    yield* _db.breedersDao
        .watchBreeders(userId)
        .map((breeders) => breeders
            .map((e) => BreedersModel(
                  id: e.id,
                  name: e.name,
                  weight: e.weight,
                  gender: e.gender,
                  age: e.age,
                  image: e.image,
                ))
            .toList())
        .onErrorReturnWith((error, stackTrace) {
      throw DatabaseExeption();
    });
  }

  @override
  Future updateBreeder({
    required int id,
    required BreedersModel e,
    required int userId,
  }) async {
    try {
      await _db.breedersDao.updateBreeders(
          id: id,
          data: BreedersDataClass(
            id: e.id,
            name: e.name,
            weight: e.weight,
            gender: e.gender,
            age: e.age,
            image: e.image!,
            user: userId,
          ));
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future deleteBreeder(int id) async {
    try {
      await _db.breedersDao.deleteBreeder(id);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future insertFeeding(
      {required int breederId,
      required double dryMatter,
      required double greenMatter,
      required bool water}) async {
    try {
      await _db.feedingDao.insertFeeding(
        breederId: breederId,
        dryMatter: dryMatter,
        greenMatter: greenMatter,
        water: water,
      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Stream<List<FeedingModel>> watchFeeding(int breederId) async* {
    yield* _db.feedingDao
        .watchFeeding(breederId)
        .map((event) => event
            .map((e) => FeedingModel(
                  id: e.id,
                  dryMatter: e.dryMatter,
                  greenMatter: e.greenMatter,
                  water: e.water,
                  date: e.date,
                ))
            .toList())
        .onErrorReturnWith((error, stackTrace) {
      throw DatabaseExeption();
    });
  }
}
