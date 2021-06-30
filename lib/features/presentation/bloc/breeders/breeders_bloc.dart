import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';
import 'package:farmerlocalmobile/features/domain/usecase/add_breeder.dart';
import 'package:farmerlocalmobile/features/domain/usecase/delete_breeder.dart';
import 'package:farmerlocalmobile/features/domain/usecase/update_breeder.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'breeders_event.dart';
part 'breeders_state.dart';

@injectable
class BreedersBloc extends Bloc<BreedersEvent, BreedersState> {
  BreedersBloc(this._add, this._update, this._delete)
      : super(BreedersInitial());
  final AddBreeder _add;
  final UpdateBreeder _update;
  final DeleteBreeder _delete;

  @override
  Stream<BreedersState> mapEventToState(
    BreedersEvent event,
  ) async* {
    if (event is AddBreedersEvent) {
      yield BreedersLoading();
      await Future.delayed(Duration(milliseconds: 1500));
      final _res = await _add.call(AddBreederParams(
        name: event.name,
        weight: event.weight,
        gender: event.gender,
        age: event.age,
        image: event.image,
      ));
      yield _res.fold(
        (l) => BreedersError(message: l),
        (r) => BreedersSuccess(),
      );
    }
    if (event is UpdateBreederEvent) {
      yield BreedersLoading();
      await Future.delayed(Duration(milliseconds: 1500));
      final _res = await _update.call(UpdateBreederParams(
        id: event.id,
        breeders: event.breeders,
        image: event.image,
      ));
      yield _res.fold(
        (l) => BreedersError(message: l),
        (r) => BreedersSuccess(),
      );
    }
    if (event is DeleteBreederEvent) {
      yield BreedersLoading();
      await Future.delayed(Duration(milliseconds: 1500));
      final _res = await _delete.call(ParamsId(id: event.id));
      yield _res.fold(
        (l) => BreedersError(message: l),
        (r) => BreedersSuccess(),
      );
    }
  }
}
