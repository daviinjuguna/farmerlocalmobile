import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchBreeder extends StreamUseCase<List<Breeders>, NoParams> {
  WatchBreeder(this._repository);

  @override
  Stream<Either<String, List<Breeders>>> call(NoParams p) {
    return _repository.watchBreeder();
  }

  final Repository _repository;
}
