import 'package:farmerlocalmobile/core/utils/constants.dart';
import 'package:farmerlocalmobile/features/data/datasource/image.dart';
import 'package:farmerlocalmobile/features/data/datasource/local.dart';
import 'package:farmerlocalmobile/features/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: Repository)
class Repo implements Repository {
  final LocalDataSource _local;
  final ImageDataSource _image;

  Repo(this._local, this._image);

  //!pick images
  @override
  Future<Either<String, String>> fetchImageUrl({required String url}) async {
    if (url == "Camera") {
      try {
        final imageFile = await _image.selectFromCamera();
        return right(imageFile);
      } catch (e) {
        print(e.toString());
        final failure = returnFailure(e);
        return left(failure);
      }
    } else {
      try {
        final imageFile = await _image.selectFromGallery();
        return right(imageFile);
      } catch (e) {
        print(e.toString());
        final failure = returnFailure(e);
        return left(failure);
      }
    }
  }

  @override
  Future<Either<String, User>> login(
      {required String email, required String password}) async {
    try {
      final _user = await _local.login(email: email, password: password);
      if (_user != null) {
        await _local.storeUserToCache(_user);
        return right(_user);
      }

      return left("Check Credentials");
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, String>> register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await _local.register(name: name, email: email, password: password);
      return right("REGISTERED");
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, bool>> logout() async {
    try {
      return right(await _local.clearPrefs());
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, User>> getUser() async {
    try {
      final _id = await _local.getStoredUser();
      if (_id != null) return right(await _local.getUser(_id));
      return left("UNAUTHENTICATED");
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, bool>> checkAuth() async {
    try {
      final _id = await _local.getStoredUser();
      if (_id != null) return right(true);
      return right(false);
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }
}
