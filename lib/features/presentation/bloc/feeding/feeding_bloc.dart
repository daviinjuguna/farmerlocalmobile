import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:farmerlocalmobile/features/domain/usecase/insert_feeding.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'feeding_event.dart';
part 'feeding_state.dart';

@injectable
class FeedingBloc extends Bloc<FeedingEvent, FeedingState> {
  FeedingBloc(this._insert) : super(FeedingInitial());
  final InsertFeeding _insert;

  @override
  Stream<FeedingState> mapEventToState(
    FeedingEvent event,
  ) async* {
    if (event is InsertFeedingEvent) {
      yield FeedingLoading();
      await Future.delayed(Duration(milliseconds: 1500));
      final _res = await _insert.call(InsertFeedingParams(
        breederId: event.breederId,
        dryMatter: event.dryMatter,
        greenMatter: event.greenMatter,
        water: event.water,
      ));
      yield _res.fold(
        (l) => FeedingError(error: l),
        (r) => FeedingSuccess(),
      );
    }
  }
}
