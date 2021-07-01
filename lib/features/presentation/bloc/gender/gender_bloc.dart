import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';
import 'package:farmerlocalmobile/features/domain/usecase/get_opp_gender.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'gender_event.dart';
part 'gender_state.dart';

@injectable
class GenderBloc extends Bloc<GenderEvent, GenderState> {
  GenderBloc(this._get) : super(GenderInitial());
  final GetOppGender _get;

  @override
  Stream<GenderState> mapEventToState(
    GenderEvent event,
  ) async* {
    if (event is GetOppGenderEvent) {
      yield GenderLoading();
      await Future.delayed(Duration(milliseconds: 1500));
      final _res = await _get.call(ParamsBool(boolValue: event.gender));
      yield _res.fold(
        (l) => GenderError(l),
        (r) => GenderSuccess(r),
      );
    }
  }
}
