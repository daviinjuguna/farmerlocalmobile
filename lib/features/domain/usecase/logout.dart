import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Logout extends UseCase<bool, NoParams> {
  Logout(this._repository);

  @override
  Future<Either<String, bool>> call(NoParams p) {
    return _repository.logout();
  }

  final Repository _repository;
}
