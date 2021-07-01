import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeding.dart';
import 'package:farmerlocalmobile/features/domain/entities/feeding.dart';
import 'package:farmerlocalmobile/features/domain/entities/user.dart';

abstract class Repository {
  Future<Either<String, String>> fetchImageUrl({required String url});

  Future<Either<String, User>> login({
    required String email,
    required String password,
  });

  Future<Either<String, String>> register({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<String, bool>> logout();

  Future<Either<String, User>> getUser();
  Future<Either<String, bool>> checkAuth();

  //*BREEDER
  Future<Either<String, String>> addBreeder({
    required String name,
    required double weight,
    required bool gender,
    required int age,
    required File image,
  });
  Stream<Either<String, List<Breeders>>> watchBreeder();
  Future<Either<String, List<Breeders>>> getOppGender(bool gender);

  Future<Either<String, String>> updateBreeder({
    required int id,
    required Breeders breeders,
    required File? image,
  });
  Future<Either<String, String>> deleteBreeder(int id);

  //*FEEDING
  Future<Either<String, String>> insertFeeding({
    required double dryMatter,
    required double greenMatter,
    required bool water,
    required int breederId,
  });
  Stream<Either<String, List<Feeding>>> watchFeeding(int breederId);
  Future<Either<String, String>> updateFeeding({
    required int id,
    required Feeding feeding,
  });
  Future<Either<String, String>> deleteFeeding(int id);

  //*BREEDING
  Future<Either<String, String>> insertBreeding({
    required int kits,
    required int breeder,
    required int mate,
  });

  Stream<Either<String, List<Breeding>>> watchBreeding(int id);
  Future<Either<String, String>> deleteBreeding(int id);
}
