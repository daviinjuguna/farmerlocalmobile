import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/entities/feeding.dart';
import 'package:farmerlocalmobile/features/domain/usecase/delete_feeding.dart';
import 'package:farmerlocalmobile/features/domain/usecase/insert_feeding.dart';
import 'package:farmerlocalmobile/features/domain/usecase/update_feeding.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'feeding_event.dart';
part 'feeding_state.dart';

@injectable
class FeedingBloc extends Bloc<FeedingEvent, FeedingState> {
  FeedingBloc(this._insert, this._delete, this._update)
      : super(FeedingInitial());
  final InsertFeeding _insert;
  final DeleteFeeding _delete;
  final UpdateFeeding _update;

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
    if (event is DeleteFeedingEvent) {
      yield FeedingLoading();
      await Future.delayed(Duration(milliseconds: 1500));
      final _res = await _delete.call(ParamsId(id: event.id));
      yield _res.fold(
        (l) => FeedingError(error: l),
        (r) => FeedingSuccess(),
      );
    }
    if (event is UpdateFeedingEvent) {
      yield FeedingLoading();
      await Future.delayed(Duration(milliseconds: 1500));
      final _res = await _update
          .call(UpdateFeedingParams(id: event.id, feeding: event.feeding));
      yield _res.fold(
        (l) => FeedingError(error: l),
        (r) => FeedingSuccess(),
      );
    }
  }
}
