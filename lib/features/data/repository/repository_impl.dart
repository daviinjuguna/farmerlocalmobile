import 'dart:io';

import 'package:farmerlocalmobile/core/utils/constants.dart';
import 'package:farmerlocalmobile/features/data/datasource/image.dart';
import 'package:farmerlocalmobile/features/data/datasource/local.dart';
import 'package:farmerlocalmobile/features/data/datasource/store_image.dart';
import 'package:farmerlocalmobile/features/data/models/breeders_model.dart';
import 'package:farmerlocalmobile/features/data/models/feeding_model.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeding.dart';
import 'package:farmerlocalmobile/features/domain/entities/feeding.dart';
import 'package:farmerlocalmobile/features/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: Repository)
class Repo implements Repository {
  final LocalDataSource _local;
  final ImageDataSource _image;
  final StoreImage _store;

  Repo(this._local, this._image, this._store);

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

  //*BREEDERS

  @override
  Future<Either<String, String>> addBreeder({
    required String name,
    required double weight,
    required bool gender,
    required int age,
    required File image,
  }) async {
    try {
      final _id = await _local.getStoredUser();
      if (_id == null) return left("Unauthenticated");
      final _imagePath = await _store.storeImage(image);

      await _local.insertBreeders(
        userId: _id,
        name: name,
        weight: weight,
        gender: gender,
        age: age,
        image: _imagePath,
      );
      return right("Added");
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Stream<Either<String, List<Breeders>>> watchBreeder() async* {
    final _id = await _local.getStoredUser();
    if (_id == null) throw UNAUTHENTICATED_FAILURE_MESSAGE;
    yield* _local
        .watchBreeders(_id)
        .map((breeders) => right<String, List<Breeders>>(breeders))
        .onErrorReturnWith((e, s) {
      print(e.toString() + "," + s.toString());
      final failure = returnFailure(e);
      return left(failure);
    });
  }

  @override
  Future<Either<String, List<Breeders>>> getOppGender(bool gender) async {
    try {
      final _id = await _local.getStoredUser();
      if (_id == null) return left("Unauthenticated");
      return right(await _local.getOppGender(userId: _id, gender: gender));
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, String>> updateBreeder({
    required int id,
    required Breeders breeders,
    required File? image,
  }) async {
    try {
      final _id = await _local.getStoredUser();
      if (_id == null) return left("Unauthenticated");
      String? _imagePath;
      if (image != null) {
        _imagePath = await _store.storeImage(image);
      }

      await _local.updateBreeder(
          id: id,
          e: BreedersModel(
            id: breeders.id,
            name: breeders.name,
            weight: breeders.weight,
            gender: breeders.gender,
            age: breeders.age,
            image: _imagePath ?? breeders.image,
          ),
          userId: _id);

      return right("UPDATED");
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, String>> deleteBreeder(int id) async {
    try {
      final _id = await _local.getStoredUser();
      if (_id == null) return left("Unauthenticated");
      await _local.deleteBreeder(id);
      return right("DELETED");
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  //*FEEDING

  @override
  Future<Either<String, String>> insertFeeding({
    required double dryMatter,
    required double greenMatter,
    required bool water,
    required int breederId,
  }) async {
    try {
      final _id = await _local.getStoredUser();
      if (_id == null) return left("Unauthenticated");
      await _local.insertFeeding(
          breederId: breederId,
          dryMatter: dryMatter,
          greenMatter: greenMatter,
          water: water);
      return right("ADDED");
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Stream<Either<String, List<Feeding>>> watchFeeding(int breederId) async* {
    final _id = await _local.getStoredUser();
    if (_id == null) throw UNAUTHENTICATED_FAILURE_MESSAGE;
    yield* _local
        .watchFeeding(breederId)
        .map((feeding) => right<String, List<Feeding>>(feeding))
        .onErrorReturnWith((e, s) {
      print(e.toString() + "," + s.toString());
      final failure = returnFailure(e);
      return left(failure);
    });
  }

  @override
  Future<Either<String, String>> updateFeeding(
      {required int id, required Feeding feeding}) async {
    try {
      final _id = await _local.getStoredUser();
      if (_id == null) return left("Unauthenticated");
      await _local.updateFeeding(
          feedingId: id,
          e: FeedingModel(
            id: feeding.id,
            dryMatter: feeding.dryMatter,
            greenMatter: feeding.greenMatter,
            water: feeding.water,
            date: feeding.date,
            breeder: feeding.breeder,
          ));
      return right("Edited");
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, String>> deleteFeeding(int id) async {
    try {
      final _id = await _local.getStoredUser();
      if (_id == null) return left("Unauthenticated");
      await _local.deleteFeeding(id);
      return right("Deleted");
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Future<Either<String, String>> insertBreeding({
    required int kits,
    required int breeder,
    required int mate,
  }) async {
    try {
      final _id = await _local.getStoredUser();
      if (_id == null) return left("Unauthenticated");
      await _local.insertBreeding(kits: kits, breeder: breeder, mate: mate);
      return right("Added");
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }

  @override
  Stream<Either<String, List<Breeding>>> watchBreeding(int id) async* {
    final _id = await _local.getStoredUser();
    if (_id == null) throw UNAUTHENTICATED_FAILURE_MESSAGE;
    yield* _local
        .watchBreeding(id)
        .map((event) => right<String, List<Breeding>>(event))
        .onErrorReturnWith((e, s) {
      print(e.toString() + "," + s.toString());
      final failure = returnFailure(e);
      return left(failure);
    });
  }

  @override
  Future<Either<String, String>> deleteBreeding(int id) async {
    try {
      final _id = await _local.getStoredUser();
      if (_id == null) return left("Unauthenticated");
      await _local.deleteBreeding(id);
      return right("Deleted");
    } catch (e) {
      print(e.toString());
      final failure = returnFailure(e);
      return left(failure);
    }
  }
}
