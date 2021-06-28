part of 'image_bloc.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageError extends ImageState {
  final String error;
  ImageError({
    required this.error,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;

  @override
  String toString() => 'ImageError(error: $error)';
}

class ImageSuccess extends ImageState {
  final String image;
  ImageSuccess({
    required this.image,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageSuccess && other.image == image;
  }

  @override
  int get hashCode => image.hashCode;

  @override
  String toString() => 'ImageSuccess(image: $image)';
}
