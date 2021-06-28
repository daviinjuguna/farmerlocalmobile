part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class PickImageEvent extends ImageEvent {
  final String location;
  PickImageEvent({
    required this.location,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PickImageEvent && other.location == location;
  }

  @override
  int get hashCode => location.hashCode;

  @override
  String toString() => 'PickImageEvent(location: $location)';
}
