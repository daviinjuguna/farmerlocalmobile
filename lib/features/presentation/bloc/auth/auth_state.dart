part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;
  AuthSuccess({
    required this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthSuccess && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'AuthSuccess(message: $message)';
}

class AuthError extends AuthState {
  final String error;
  AuthError({
    required this.error,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;

  @override
  String toString() => 'AuthError(error: $error)';
}
