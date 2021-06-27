import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection({String? environment}) async =>
    await $initGetIt(getIt, environment: environment);

abstract class Env {
  static const DEV = 'dev';
  static const PROD = 'prod';
}
