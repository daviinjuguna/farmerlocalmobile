import 'package:dartz/dartz.dart';
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
}
