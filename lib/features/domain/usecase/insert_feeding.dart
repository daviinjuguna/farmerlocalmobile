import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class InsertFeeding extends UseCase<String, InsertFeedingParams> {
  InsertFeeding(this._repository);

  @override
  Future<Either<String, String>> call(InsertFeedingParams p) {
    return _repository.insertFeeding(
        dryMatter: p.dryMatter,
        greenMatter: p.greenMatter,
        water: p.water,
        breederId: p.breederId);
  }

  final Repository _repository;
}

class InsertFeedingParams {
  final int breederId;
  final double dryMatter;
  final double greenMatter;
  final bool water;
  InsertFeedingParams({
    required this.breederId,
    required this.dryMatter,
    required this.greenMatter,
    required this.water,
  });

  InsertFeedingParams copyWith({
    int? breederId,
    double? dryMatter,
    double? greenMatter,
    bool? water,
  }) {
    return InsertFeedingParams(
      breederId: breederId ?? this.breederId,
      dryMatter: dryMatter ?? this.dryMatter,
      greenMatter: greenMatter ?? this.greenMatter,
      water: water ?? this.water,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InsertFeedingParams &&
        other.breederId == breederId &&
        other.dryMatter == dryMatter &&
        other.greenMatter == greenMatter &&
        other.water == water;
  }

  @override
  int get hashCode {
    return breederId.hashCode ^
        dryMatter.hashCode ^
        greenMatter.hashCode ^
        water.hashCode;
  }

  @override
  String toString() {
    return 'InsertFeedingParams(breederId: $breederId, dryMatter: $dryMatter, greenMatter: $greenMatter, water: $water)';
  }
}
