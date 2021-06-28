import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CheckAuth extends UseCase<bool, NoParams> {
  CheckAuth(this._repository);

  @override
  Future<Either<String, bool>> call(NoParams p) {
    return _repository.checkAuth();
  }

  final Repository _repository;
}
