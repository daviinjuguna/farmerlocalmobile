import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/usecase/check_auth.dart';
import 'package:farmerlocalmobile/features/domain/usecase/logout.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this._auth, this._logout) : super(SplashInitial());
  final CheckAuth _auth;
  final Logout _logout;

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
    if (event is LogoutEvent) {
      yield SplashLoading();
      await Future.delayed(Duration(milliseconds: 1500));

      final _res = await _logout.call(NoParams());
      yield _res.fold(
        (l) => SplashLoggedOut(),
        (r) {
          if (r) return SplashLoggedOut();
          return SplashLoggedOut();
        },
      );
    }
  }
}
