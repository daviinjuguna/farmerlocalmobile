import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/entities/feeding.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchFeeding extends StreamUseCase<List<Feeding>, ParamsId> {
  WatchFeeding(this._repository);

  @override
  Stream<Either<String, List<Feeding>>> call(ParamsId p) {
    return _repository.watchFeeding(p.id);
  }

  final Repository _repository;
}
