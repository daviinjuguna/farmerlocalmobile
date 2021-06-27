import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class ModuleInjection {
  //*shared preferences for cache storage
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  //*picking images
  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();
}
