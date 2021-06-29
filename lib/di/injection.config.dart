// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../database/app_database.dart' as _i3;
import '../features/data/datasource/image.dart' as _i7;
import '../features/data/datasource/local.dart' as _i8;
import '../features/data/datasource/store_image.dart' as _i6;
import '../features/data/repository/repository_impl.dart' as _i10;
import '../features/domain/repository/repository.dart' as _i9;
import '../features/domain/usecase/add_breeder.dart' as _i14;
import '../features/domain/usecase/check_auth.dart' as _i15;
import '../features/domain/usecase/delete_breeder.dart' as _i16;
import '../features/domain/usecase/get_user.dart' as _i17;
import '../features/domain/usecase/login.dart' as _i18;
import '../features/domain/usecase/logout.dart' as _i19;
import '../features/domain/usecase/pick_image.dart' as _i20;
import '../features/domain/usecase/register.dart' as _i21;
import '../features/domain/usecase/update_breeder.dart' as _i11;
import '../features/domain/usecase/watch_breeder.dart' as _i12;
import '../features/presentation/bloc/auth/auth_bloc.dart' as _i24;
import '../features/presentation/bloc/breeders/breeders_bloc.dart' as _i25;
import '../features/presentation/bloc/image/image_bloc.dart' as _i26;
import '../features/presentation/bloc/splash/splash_bloc.dart' as _i22;
import '../features/presentation/bloc/user/user_bloc.dart' as _i23;
import '../features/presentation/bloc/watch_breeder/watch_breeder_bloc.dart'
    as _i13;
import 'module_injection.dart' as _i27; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i6.StoreImage>(() => _i6.StoreImageImpl());
  gh.lazySingleton<_i7.ImageDataSource>(
      () => _i7.ImageDataSourceImpl(imagePicker: get<_i4.ImagePicker>()));
  gh.lazySingleton<_i8.LocalDataSource>(
      () => _i8.Local(get<_i3.AppDatabase>(), get<_i5.SharedPreferences>()));
  gh.lazySingleton<_i9.Repository>(() => _i10.Repo(get<_i8.LocalDataSource>(),
      get<_i7.ImageDataSource>(), get<_i6.StoreImage>()));
  gh.lazySingleton<_i11.UpdateBreeder>(
      () => _i11.UpdateBreeder(get<_i9.Repository>()));
  gh.lazySingleton<_i12.WatchBreeder>(
      () => _i12.WatchBreeder(get<_i9.Repository>()));
  gh.factory<_i13.WatchBreederBloc>(
      () => _i13.WatchBreederBloc(get<_i12.WatchBreeder>()));
  gh.lazySingleton<_i14.AddBreeder>(
      () => _i14.AddBreeder(get<_i9.Repository>()));
  gh.lazySingleton<_i15.CheckAuth>(() => _i15.CheckAuth(get<_i9.Repository>()));
  gh.lazySingleton<_i16.DeleteBreeder>(
      () => _i16.DeleteBreeder(get<_i9.Repository>()));
  gh.lazySingleton<_i17.GetUser>(() => _i17.GetUser(get<_i9.Repository>()));
  gh.lazySingleton<_i18.Login>(() => _i18.Login(get<_i9.Repository>()));
  gh.lazySingleton<_i19.Logout>(() => _i19.Logout(get<_i9.Repository>()));
  gh.lazySingleton<_i20.PickImage>(() => _i20.PickImage(get<_i9.Repository>()));
  gh.lazySingleton<_i21.Register>(() => _i21.Register(get<_i9.Repository>()));
  gh.factory<_i22.SplashBloc>(() => _i22.SplashBloc(get<_i15.CheckAuth>()));
  gh.factory<_i23.UserBloc>(() => _i23.UserBloc(get<_i17.GetUser>()));
  gh.factory<_i24.AuthBloc>(
      () => _i24.AuthBloc(get<_i18.Login>(), get<_i21.Register>()));
  gh.factory<_i25.BreedersBloc>(() => _i25.BreedersBloc(get<_i14.AddBreeder>(),
      get<_i11.UpdateBreeder>(), get<_i16.DeleteBreeder>()));
  gh.factory<_i26.ImageBloc>(() => _i26.ImageBloc(get<_i20.PickImage>()));
  return get;
}

class _$ModuleInjection extends _i27.ModuleInjection {}
