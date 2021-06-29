import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';
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

  Future<Either<String, String>> addBreeder({
    required String name,
    required double weight,
    required bool gender,
    required int age,
    required File image,
  });
  Stream<Either<String, List<Breeders>>> watchBreeder();
  Future<Either<String, String>> updateBreeder({
    required int id,
    required Breeders breeders,
  });
  Future<Either<String, String>> deleteBreeder(int id);
}
