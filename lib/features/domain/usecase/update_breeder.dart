import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';
import 'package:farmerlocalmobile/features/domain/repository/repository.dart';

@lazySingleton
class UpdateBreeder extends UseCase<String, UpdateBreederParams> {
  UpdateBreeder(this._repository);

  @override
  Future<Either<String, String>> call(UpdateBreederParams p) {
    return _repository.updateBreeder(
        id: p.id, breeders: p.breeders, image: p.image);
  }

  final Repository _repository;
}

class UpdateBreederParams {
  final int id;
  final Breeders breeders;
  final File? image;

  UpdateBreederParams({
    required this.id,
    required this.breeders,
    this.image,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpdateBreederParams &&
        other.id == id &&
        other.breeders == breeders &&
        other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ breeders.hashCode ^ image.hashCode;

  @override
  String toString() =>
      'UpdateBreederParams(id: $id, breeders: $breeders, image: $image)';
}
