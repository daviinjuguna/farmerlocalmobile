import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:farmerlocalmobile/features/domain/usecase/login.dart';
import 'package:farmerlocalmobile/features/domain/usecase/register.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._login, this._register) : super(AuthInitial());
  final Login _login;
  final Register _register;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthLogin) {
      yield AuthLoading();
      final _res = await _login
          .call(LoginParams(email: event.email, password: event.password));
      await Future.delayed(Duration(milliseconds: 1500)); //*loading effect
      yield _res.fold(
        (l) => AuthError(error: l),
        (r) => AuthSuccess(message: "Logged In"),
      );
    }
    if (event is AuthRegister) {
      yield AuthLoading();
      final _res = await _register.call(RegisterParams(
          name: event.name, email: event.email, password: event.password));
      await Future.delayed(Duration(milliseconds: 1500)); //*loading effect
      yield _res.fold(
        (l) => AuthError(error: l),
        (r) => AuthSuccess(message: "Registered"),
      );
    }
  }
}
