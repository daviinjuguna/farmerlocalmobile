// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../database/app_database.dart' as _i3;
import '../features/data/datasource/image.dart' as _i6;
import '../features/data/datasource/local.dart' as _i7;
import '../features/data/repository/repository_impl.dart' as _i9;
import '../features/domain/repository/repository.dart' as _i8;
import '../features/domain/usecase/get_user.dart' as _i10;
import '../features/domain/usecase/login.dart' as _i11;
import '../features/domain/usecase/logout.dart' as _i12;
import '../features/domain/usecase/register.dart' as _i13;
import 'module_injection.dart' as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final moduleInjection = _$ModuleInjection();
  gh.lazySingleton<_i3.AppDatabase>(() => _i3.AppDatabase());
  gh.lazySingleton<_i4.ImagePicker>(() => moduleInjection.imagePicker);
  await gh.factoryAsync<_i5.SharedPreferences>(() => moduleInjection.prefs,
      preResolve: true);
  gh.lazySingleton<_i6.ImageDataSource>(
      () => _i6.ImageDataSourceImpl(imagePicker: get<_i4.ImagePicker>()));
  gh.lazySingleton<_i7.LocalDataSource>(
      () => _i7.Local(get<_i3.AppDatabase>(), get<_i5.SharedPreferences>()));
  gh.lazySingleton<_i8.Repository>(
      () => _i9.Repo(get<_i7.LocalDataSource>(), get<_i6.ImageDataSource>()));
  gh.lazySingleton<_i10.GetUser>(() => _i10.GetUser(get<_i8.Repository>()));
  gh.lazySingleton<_i11.Login>(() => _i11.Login(get<_i8.Repository>()));
  gh.lazySingleton<_i12.Logout>(() => _i12.Logout(get<_i8.Repository>()));
  gh.lazySingleton<_i13.Register>(() => _i13.Register(get<_i8.Repository>()));
  return get;
}

class _$ModuleInjection extends _i14.ModuleInjection {}
