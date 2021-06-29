import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateBreeder extends UseCase<String, UpdateBreederParams> {
  UpdateBreeder(this._repository);

  @override
  Future<Either<String, String>> call(UpdateBreederParams p) {
    return _repository.updateBreeder(id: p.id, breeders: p.breeders);
  }

  final Repository _repository;
}

class UpdateBreederParams {
  final int id;
  final Breeders breeders;
  UpdateBreederParams({
    required this.id,
    required this.breeders,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpdateBreederParams &&
        other.id == id &&
        other.breeders == breeders;
  }

  @override
  int get hashCode => id.hashCode ^ breeders.hashCode;

  @override
  String toString() => 'UpdateBreederParams(id: $id, breeders: $breeders)';
}
