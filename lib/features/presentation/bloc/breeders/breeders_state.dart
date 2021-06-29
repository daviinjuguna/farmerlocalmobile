part of 'breeders_bloc.dart';

@immutable
abstract class BreedersState {}

class BreedersInitial extends BreedersState {}

class BreedersLoading extends BreedersState {}

class BreedersSuccess extends BreedersState {}

class BreedersError extends BreedersState {
  final String message;
  BreedersError({
    required this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BreedersError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'BreedersError(message: $message)';
}
