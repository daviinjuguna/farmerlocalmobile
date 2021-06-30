import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/watch_blocs/bloc_base.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:farmerlocalmobile/features/domain/entities/breeding.dart';
import 'package:farmerlocalmobile/features/domain/usecase/watch_breeding.dart';

@injectable
class WatchBreedingBloc extends BlocBase {
  final WatchBreeding _watch;

  StreamSubscription<Either<String, List<Breeding>>>? _subscription;
  BehaviorSubject<BreedingResponse> _subject =
      BehaviorSubject<BreedingResponse>();

  WatchBreedingBloc(this._watch);

  void watchBreeding(int id) {
    _subscription?.cancel();
    _subscription = _watch.call(ParamsId(id: id)).listen(
          (event) => event.fold(
            (l) {
              final _res = BreedingResponse.withError(l);
              _subject.sink.add(_res);
            },
            (breeding) {
              final _res = BreedingResponse(breeding: breeding);
              _subject.sink.add(_res);
            },
          ),
        );
  }

  BehaviorSubject<BreedingResponse> get subJect => _subject;

  @override
  void close() {
    _subscription?.cancel();
    _subject.close();
  }
}

class BreedingResponse {
  final List<Breeding> breeding;
  final String? error;

  BreedingResponse({
    required this.breeding,
    this.error,
  });

  BreedingResponse.withError(this.error) : breeding = const [];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BreedingResponse &&
        listEquals(other.breeding, breeding) &&
        other.error == error;
  }

  @override
  int get hashCode => breeding.hashCode ^ error.hashCode;

  @override
  String toString() => 'BreedingResponse(breeding: $breeding, error: $error)';
}
