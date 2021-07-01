import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetOppGender extends UseCase<List<Breeders>, ParamsBool> {
  GetOppGender(this._repository);

  @override
  Future<Either<String, List<Breeders>>> call(ParamsBool p) {
    return _repository.getOppGender(p.boolValue);
  }

  final Repository _repository;
}
