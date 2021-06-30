import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:farmerlocalmobile/features/domain/usecase/delete_breeding.dart';
import 'package:farmerlocalmobile/features/domain/usecase/insert_breeding.dart';

part 'breeding_event.dart';
part 'breeding_state.dart';

@injectable
class BreedingBloc extends Bloc<BreedingEvent, BreedingState> {
  BreedingBloc(this._insert, this._delete) : super(BreedingInitial());
  final InsertBreeding _insert;
  final DeleteBreeding _delete;

  @override
  Stream<BreedingState> mapEventToState(
    BreedingEvent event,
  ) async* {
    if (event is AddBreedingEvent) {
      yield BreedingLoading();
      await Future.delayed(Duration(milliseconds: 1500));
      final _res = await _insert.call(InsertBreedingParams(
          kits: event.kits, breeder: event.breeder, mate: event.mate));
      yield _res.fold(
        (l) => BreedingError(error: l),
        (r) => BreedingSuccess(),
      );
    }
    if (event is DeleteBreedingEvent) {
      yield BreedingLoading();
      await Future.delayed(Duration(milliseconds: 1500));
      final _res = await _delete.call(ParamsId(id: event.id));
      yield _res.fold(
        (l) => BreedingError(error: l),
        (r) => BreedingSuccess(),
      );
    }
  }
}
