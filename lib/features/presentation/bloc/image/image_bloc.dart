import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:farmerlocalmobile/core/utils/use_case.dart';
import 'package:farmerlocalmobile/features/domain/usecase/pick_image.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'image_event.dart';
part 'image_state.dart';

@injectable
class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc(this._image) : super(ImageInitial());
  final PickImage _image;

  @override
  Stream<ImageState> mapEventToState(
    ImageEvent event,
  ) async* {
    if (event is PickImageEvent) {
      yield ImageLoading();
      final _res = await _image.call(ParamsString(string: event.location));
      yield _res.fold(
        (l) => ImageError(error: l),
        (r) => ImageSuccess(image: r),
      );
    }
  }
}
