import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';
import 'package:farmerlocalmobile/features/domain/usecase/watch_breeder.dart';

import 'bloc_base.dart';

@injectable
class WatchBreederBloc extends BlocBase {
  final WatchBreeder _breeder;

  StreamSubscription<Either<String, List<Breeders>>>? _subscription;

  WatchBreederBloc(this._breeder) {
    _subscription?.cancel();

    _subscription = _breeder.call(NoParams()).listen(
      (event) {
        return event.fold(
          (failure) {
            BreedersResponse _res = BreedersResponse.withError(failure);
            _subject.sink.add(_res);
          },
          (breeders) {
            BreedersResponse _res = BreedersResponse(breeders: breeders);
            _subject.sink.add(_res);
          },
        );
      },
    );
  }

  BehaviorSubject<BreedersResponse> _subject =
      BehaviorSubject<BreedersResponse>();
  BehaviorSubject<BreedersResponse> get subJect => _subject;

  @override
  void close() {
    _subject.close();
    _subscription?.cancel();
  }
}

class BreedersResponse {
  List<Breeders> breeders;
  final String? error;

  BreedersResponse({
    required this.breeders,
    this.error,
  });

  BreedersResponse.withError(this.error) : breeders = [];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BreedersResponse &&
        listEquals(other.breeders, breeders) &&
        other.error == error;
  }

  @override
  int get hashCode => breeders.hashCode ^ error.hashCode;

  @override
  String toString() => 'BreedersResponse(breeders: $breeders, error: $error)';
}
