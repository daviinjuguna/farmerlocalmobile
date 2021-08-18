import 'package:farmerlocalmobile/core/errors/exeptions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:image_cropper/image_cropper.dart';

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
      final image = await imagePicker.pickImage(source: ImageSource.camera);
      if (image != null) {
        final _cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          cropStyle: CropStyle.circle,
          aspectRatioPresets: [CropAspectRatioPreset.square],
          androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            // toolbarColor: Colors.red,
            // toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          iosUiSettings: IOSUiSettings(
            title: 'Crop Image',
            showCancelConfirmationDialog: true,
          ),
        );
        return _cropped?.path ?? image.path;
      }
      throw SelectImageException();
    } catch (e) {
      print("Error Camera is here: $e");
      throw SelectImageFromCameraException();
    }
  }

  @override
  Future<String> selectFromGallery() async {
    try {
      final image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final _cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          cropStyle: CropStyle.circle,
          aspectRatioPresets: [CropAspectRatioPreset.square],
          androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            // toolbarColor: Colors.red,
            // toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          iosUiSettings: IOSUiSettings(
            title: 'Crop Image',
            showCancelConfirmationDialog: true,
          ),
        );
        return _cropped?.path ?? image.path;
      }
      throw SelectImageException();
    } catch (e) {
      print("Error Gallarey is here: $e");
      throw SelectImageFromGalleryException();
    }
  }
}
