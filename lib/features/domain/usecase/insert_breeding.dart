import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class InsertBreeding extends UseCase<String, InsertBreedingParams> {
  InsertBreeding(this._repository);

  @override
  Future<Either<String, String>> call(InsertBreedingParams p) {
    return _repository.insertBreeding(
      kits: p.kits,
      breeder: p.breeder,
      mate: p.mate,
    );
  }

  final Repository _repository;
}

class InsertBreedingParams {
  final int kits;
  final int breeder;
  final int mate;
  InsertBreedingParams({
    required this.kits,
    required this.breeder,
    required this.mate,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InsertBreedingParams &&
        other.kits == kits &&
        other.breeder == breeder &&
        other.mate == mate;
  }

  @override
  int get hashCode => kits.hashCode ^ breeder.hashCode ^ mate.hashCode;

  InsertBreedingParams copyWith({
    int? kits,
    int? breeder,
    int? mate,
  }) {
    return InsertBreedingParams(
      kits: kits ?? this.kits,
      breeder: breeder ?? this.breeder,
      mate: mate ?? this.mate,
    );
  }

  @override
  String toString() =>
      'InsertBreedingParams(kits: $kits, breeder: $breeder, mate: $mate)';
}
