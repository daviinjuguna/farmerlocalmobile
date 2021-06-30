import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteBreeding extends UseCase<String, ParamsId> {
  DeleteBreeding(this._repository);

  @override
  Future<Either<String, String>> call(ParamsId p) {
    return _repository.deleteBreeding(p.id);
  }

  final Repository _repository;
}
