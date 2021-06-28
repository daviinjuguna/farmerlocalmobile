import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/entities/user.dart';
import 'package:farmerlocalmobile/features/domain/usecase/get_user.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._user) : super(UserInitial());
  final GetUser _user;

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserGetEvent) {
      yield UserLoading();
      final _res = await _user.call(NoParams());
      yield _res.fold(
        (l) => UserError(error: l),
        (r) => UserSuccess(user: r),
      );
    }
  }
}
