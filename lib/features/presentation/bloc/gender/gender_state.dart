part of 'gender_bloc.dart';

@immutable
abstract class GenderState {}

class GenderInitial extends GenderState {}

class GenderLoading extends GenderState {}

class GenderError extends GenderState {
  final String error;

  GenderError(this.error);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenderError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;

  @override
  String toString() => 'GenderError(error: $error)';
}

class GenderSuccess extends GenderState {
  final List<Breeders> breeders;

  GenderSuccess(this.breeders);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenderSuccess && listEquals(other.breeders, breeders);
  }

  @override
  int get hashCode => breeders.hashCode;

  @override
  String toString() => 'GenderSuccess(breeders: $breeders)';
}
