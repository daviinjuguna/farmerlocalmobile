part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent {}

class SplashAuth extends SplashEvent {}

class LogoutEvent extends SplashEvent {}
