import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeding.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchBreeding extends StreamUseCase<List<Breeding>, ParamsId> {
  WatchBreeding(this._repository);

  @override
  Stream<Either<String, List<Breeding>>> call(ParamsId p) {
    return _repository.watchBreeding(p.id);
  }

  final Repository _repository;
}
