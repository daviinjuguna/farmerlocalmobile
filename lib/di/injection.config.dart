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
import '../features/domain/usecase/add_breeder.dart' as _i17;
import '../features/domain/usecase/check_auth.dart' as _i18;
import '../features/domain/usecase/delete_breeder.dart' as _i19;
import '../features/domain/usecase/delete_feeding.dart' as _i20;
import '../features/domain/usecase/get_user.dart' as _i21;
import '../features/domain/usecase/insert_feeding.dart' as _i22;
import '../features/domain/usecase/login.dart' as _i23;
import '../features/domain/usecase/logout.dart' as _i24;
import '../features/domain/usecase/pick_image.dart' as _i25;
import '../features/domain/usecase/register.dart' as _i26;
import '../features/domain/usecase/update_breeder.dart' as _i11;
import '../features/domain/usecase/update_feeding.dart' as _i12;
import '../features/domain/usecase/watch_breeder.dart' as _i13;
import '../features/domain/usecase/watch_feeding.dart' as _i15;
import '../features/presentation/bloc/auth/auth_bloc.dart' as _i29;
import '../features/presentation/bloc/breeders/breeders_bloc.dart' as _i30;
import '../features/presentation/bloc/feeding/feeding_bloc.dart' as _i31;
import '../features/presentation/bloc/image/image_bloc.dart' as _i32;
import '../features/presentation/bloc/splash/splash_bloc.dart' as _i27;
import '../features/presentation/bloc/user/user_bloc.dart' as _i28;
import '../features/presentation/bloc/watch_blocs/watch_breeder_bloc.dart'
    as _i14;
import '../features/presentation/bloc/watch_blocs/watch_feeding.dart' as _i16;
import 'module_injection.dart' as _i33; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i12.UpdateFeeding>(
      () => _i12.UpdateFeeding(get<_i9.Repository>()));
  gh.lazySingleton<_i13.WatchBreeder>(
      () => _i13.WatchBreeder(get<_i9.Repository>()));
  gh.factory<_i14.WatchBreederBloc>(
      () => _i14.WatchBreederBloc(get<_i13.WatchBreeder>()));
  gh.lazySingleton<_i15.WatchFeeding>(
      () => _i15.WatchFeeding(get<_i9.Repository>()));
  gh.factory<_i16.WatchFeedingBloc>(
      () => _i16.WatchFeedingBloc(get<_i15.WatchFeeding>()));
  gh.lazySingleton<_i17.AddBreeder>(
      () => _i17.AddBreeder(get<_i9.Repository>()));
  gh.lazySingleton<_i18.CheckAuth>(() => _i18.CheckAuth(get<_i9.Repository>()));
  gh.lazySingleton<_i19.DeleteBreeder>(
      () => _i19.DeleteBreeder(get<_i9.Repository>()));
  gh.lazySingleton<_i20.DeleteFeeding>(
      () => _i20.DeleteFeeding(get<_i9.Repository>()));
  gh.lazySingleton<_i21.GetUser>(() => _i21.GetUser(get<_i9.Repository>()));
  gh.lazySingleton<_i22.InsertFeeding>(
      () => _i22.InsertFeeding(get<_i9.Repository>()));
  gh.lazySingleton<_i23.Login>(() => _i23.Login(get<_i9.Repository>()));
  gh.lazySingleton<_i24.Logout>(() => _i24.Logout(get<_i9.Repository>()));
  gh.lazySingleton<_i25.PickImage>(() => _i25.PickImage(get<_i9.Repository>()));
  gh.lazySingleton<_i26.Register>(() => _i26.Register(get<_i9.Repository>()));
  gh.factory<_i27.SplashBloc>(() => _i27.SplashBloc(get<_i18.CheckAuth>()));
  gh.factory<_i28.UserBloc>(() => _i28.UserBloc(get<_i21.GetUser>()));
  gh.factory<_i29.AuthBloc>(
      () => _i29.AuthBloc(get<_i23.Login>(), get<_i26.Register>()));
  gh.factory<_i30.BreedersBloc>(() => _i30.BreedersBloc(get<_i17.AddBreeder>(),
      get<_i11.UpdateBreeder>(), get<_i19.DeleteBreeder>()));
  gh.factory<_i31.FeedingBloc>(() => _i31.FeedingBloc(get<_i22.InsertFeeding>(),
      get<_i20.DeleteFeeding>(), get<_i12.UpdateFeeding>()));
  gh.factory<_i32.ImageBloc>(() => _i32.ImageBloc(get<_i25.PickImage>()));
  return get;
}

class _$ModuleInjection extends _i33.ModuleInjection {}
