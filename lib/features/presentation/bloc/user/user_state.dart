part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final User user;
  UserSuccess({
    required this.user,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserSuccess && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;

  @override
  String toString() => 'UserSuccess(user: $user)';
}

class UserError extends UserState {
  final String error;
  UserError({
    required this.error,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;

  @override
  String toString() => 'UserError(error: $error)';
}
