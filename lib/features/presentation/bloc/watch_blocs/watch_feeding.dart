import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:farmerlocalmobile/features/domain/entities/feeding.dart';
import 'package:farmerlocalmobile/features/domain/usecase/watch_feeding.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/watch_blocs/bloc_base.dart';

@injectable
class WatchFeedingBloc extends BlocBase {
  final WatchFeeding _feeding;
  StreamSubscription<Either<String, List<Feeding>>>? _subscription;
  BehaviorSubject<FeedingResponse> _subject =
      BehaviorSubject<FeedingResponse>();

  WatchFeedingBloc(this._feeding);

  void streamFeeding(int id) {
    _subscription?.cancel();
    _subscription = _feeding.call(ParamsId(id: id)).listen(
          (event) => event.fold(
            (error) {
              final _res = FeedingResponse.withError(error);
              _subject.sink.add(_res);
            },
            (feeding) {
              final _res = FeedingResponse(feeding: feeding);
              _subject.sink.add(_res);
            },
          ),
        );
  }

  BehaviorSubject<FeedingResponse> get subJect => _subject;

  @override
  void close() {
    _subscription?.cancel();
    _subject.close();
  }
}

class FeedingResponse {
  final List<Feeding> feeding;
  final String? error;

  FeedingResponse({
    required this.feeding,
    this.error,
  });

  FeedingResponse.withError(this.error) : feeding = [];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FeedingResponse &&
        listEquals(other.feeding, feeding) &&
        other.error == error;
  }

  @override
  int get hashCode => feeding.hashCode ^ error.hashCode;

  @override
  String toString() => 'FeedingResponse(feeding: $feeding, error: $error)';
}
