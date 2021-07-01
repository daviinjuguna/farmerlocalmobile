part of 'gender_bloc.dart';

@immutable
abstract class GenderEvent {}

class GetOppGenderEvent extends GenderEvent {
  final bool gender;

  GetOppGenderEvent(
    this.gender,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetOppGenderEvent && other.gender == gender;
  }

  @override
  int get hashCode => gender.hashCode;

  GetOppGenderEvent copyWith({
    bool? gender,
  }) {
    return GetOppGenderEvent(
      gender ?? this.gender,
    );
  }

  @override
  String toString() => 'GetOppGenderEvent(gender: $gender)';
}
