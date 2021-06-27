import 'package:farmerlocalmobile/core/errors/exeptions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

abstract class ImageDataSource {
  Future<String> selectFromCamera();
  Future<String> selectFromGallery();
}

@LazySingleton(as: ImageDataSource)
class ImageDataSourceImpl extends ImageDataSource {
  final ImagePicker imagePicker;

  ImageDataSourceImpl({required this.imagePicker});

  @override
  Future<String> selectFromCamera() async {
    try {
      final image = await imagePicker.getImage(source: ImageSource.camera);
      if (image != null) {
        return image.path;
      } else {
        throw SelectImageException();
      }
    } catch (e) {
      print("Error Camera is here: $e");
      throw SelectImageFromCameraException();
    }
  }

  @override
  Future<String> selectFromGallery() async {
    try {
      final image = await imagePicker.getImage(source: ImageSource.gallery);
      if (image != null) {
        return image.path;
      } else {
        throw SelectImageException();
      }
    } catch (e) {
      print("Error Gallarey is here: $e");
      throw SelectImageFromGalleryException();
    }
  }
}
