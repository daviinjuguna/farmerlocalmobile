import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/usecase/check_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this._auth) : super(SplashInitial());
  final CheckAuth _auth;

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    if (event is SplashAuth) {
      yield SplashLoading();
      final _res = await _auth.call(NoParams());
      yield _res.fold(
        (l) => SplashLoggedOut(),
        (r) {
          if (r) return SplashSuccess();
          return SplashLoggedOut();
        },
      );
    }
  }
}
