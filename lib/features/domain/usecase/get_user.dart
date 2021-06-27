import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/entities/user.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUser extends UseCase<User, NoParams> {
  GetUser(this._repository);

  @override
  Future<Either<String, User>> call(NoParams p) {
    return _repository.getUser();
  }

  final Repository _repository;
}
