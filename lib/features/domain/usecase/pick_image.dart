import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PickImage extends UseCase<String, ParamsString> {
  final Repository _repository;

  PickImage(this._repository);

  @override
  Future<Either<String, String>> call(ParamsString p) {
    return _repository.fetchImageUrl(url: p.string);
  }
}
