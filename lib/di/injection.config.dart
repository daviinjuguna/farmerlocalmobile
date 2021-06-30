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
import '../features/domain/usecase/add_breeder.dart' as _i16;
import '../features/domain/usecase/check_auth.dart' as _i17;
import '../features/domain/usecase/delete_breeder.dart' as _i18;
import '../features/domain/usecase/get_user.dart' as _i19;
import '../features/domain/usecase/insert_feeding.dart' as _i20;
import '../features/domain/usecase/login.dart' as _i21;
import '../features/domain/usecase/logout.dart' as _i22;
import '../features/domain/usecase/pick_image.dart' as _i23;
import '../features/domain/usecase/register.dart' as _i24;
import '../features/domain/usecase/update_breeder.dart' as _i11;
import '../features/domain/usecase/watch_breeder.dart' as _i12;
import '../features/domain/usecase/watch_feeding.dart' as _i14;
import '../features/presentation/bloc/auth/auth_bloc.dart' as _i27;
import '../features/presentation/bloc/breeders/breeders_bloc.dart' as _i28;
import '../features/presentation/bloc/feeding/feeding_bloc.dart' as _i29;
import '../features/presentation/bloc/image/image_bloc.dart' as _i30;
import '../features/presentation/bloc/splash/splash_bloc.dart' as _i25;
import '../features/presentation/bloc/user/user_bloc.dart' as _i26;
import '../features/presentation/bloc/watch_blocs/watch_breeder_bloc.dart'
    as _i13;
import '../features/presentation/bloc/watch_blocs/watch_feeding.dart' as _i15;
import 'module_injection.dart' as _i31; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i14.WatchFeeding>(
      () => _i14.WatchFeeding(get<_i9.Repository>()));
  gh.factory<_i15.WatchFeedingBloc>(
      () => _i15.WatchFeedingBloc(get<_i14.WatchFeeding>()));
  gh.lazySingleton<_i16.AddBreeder>(
      () => _i16.AddBreeder(get<_i9.Repository>()));
  gh.lazySingleton<_i17.CheckAuth>(() => _i17.CheckAuth(get<_i9.Repository>()));
  gh.lazySingleton<_i18.DeleteBreeder>(
      () => _i18.DeleteBreeder(get<_i9.Repository>()));
  gh.lazySingleton<_i19.GetUser>(() => _i19.GetUser(get<_i9.Repository>()));
  gh.lazySingleton<_i20.InsertFeeding>(
      () => _i20.InsertFeeding(get<_i9.Repository>()));
  gh.lazySingleton<_i21.Login>(() => _i21.Login(get<_i9.Repository>()));
  gh.lazySingleton<_i22.Logout>(() => _i22.Logout(get<_i9.Repository>()));
  gh.lazySingleton<_i23.PickImage>(() => _i23.PickImage(get<_i9.Repository>()));
  gh.lazySingleton<_i24.Register>(() => _i24.Register(get<_i9.Repository>()));
  gh.factory<_i25.SplashBloc>(() => _i25.SplashBloc(get<_i17.CheckAuth>()));
  gh.factory<_i26.UserBloc>(() => _i26.UserBloc(get<_i19.GetUser>()));
  gh.factory<_i27.AuthBloc>(
      () => _i27.AuthBloc(get<_i21.Login>(), get<_i24.Register>()));
  gh.factory<_i28.BreedersBloc>(() => _i28.BreedersBloc(get<_i16.AddBreeder>(),
      get<_i11.UpdateBreeder>(), get<_i18.DeleteBreeder>()));
  gh.factory<_i29.FeedingBloc>(
      () => _i29.FeedingBloc(get<_i20.InsertFeeding>()));
  gh.factory<_i30.ImageBloc>(() => _i30.ImageBloc(get<_i23.PickImage>()));
  return get;
}

class _$ModuleInjection extends _i31.ModuleInjection {}
