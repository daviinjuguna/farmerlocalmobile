part of 'breeding_bloc.dart';

@immutable
abstract class BreedingState {}

class BreedingInitial extends BreedingState {}

class BreedingLoading extends BreedingState {}

class BreedingSuccess extends BreedingState {}

class BreedingError extends BreedingState {
  final String error;
  BreedingError({
    required this.error,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BreedingError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;

  @override
  String toString() => 'BreedingError(error: $error)';
}
