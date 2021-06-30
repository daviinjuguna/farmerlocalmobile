import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/entities/feeding.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';

@lazySingleton
class UpdateFeeding extends UseCase<String, UpdateFeedingParams> {
  UpdateFeeding(this._repository);

  @override
  Future<Either<String, String>> call(UpdateFeedingParams p) {
    return _repository.updateFeeding(id: p.id, feeding: p.feeding);
  }

  final Repository _repository;
}

class UpdateFeedingParams {
  final int id;
  final Feeding feeding;
  UpdateFeedingParams({
    required this.id,
    required this.feeding,
  });

  UpdateFeedingParams copyWith({
    int? id,
    Feeding? feeding,
  }) {
    return UpdateFeedingParams(
      id: id ?? this.id,
      feeding: feeding ?? this.feeding,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpdateFeedingParams &&
        other.id == id &&
        other.feeding == feeding;
  }

  @override
  int get hashCode => id.hashCode ^ feeding.hashCode;

  @override
  String toString() => 'UpdateFeedingParams(id: $id, feeding: $feeding)';
}
