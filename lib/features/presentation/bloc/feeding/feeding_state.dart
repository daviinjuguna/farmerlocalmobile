part of 'feeding_bloc.dart';

@immutable
abstract class FeedingState {}

class FeedingInitial extends FeedingState {}

class FeedingLoading extends FeedingState {}

class FeedingSuccess extends FeedingState {}

class FeedingError extends FeedingState {
  final String error;
  FeedingError({
    required this.error,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FeedingError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;

  @override
  String toString() => 'FeedingError(error: $error)';
}
