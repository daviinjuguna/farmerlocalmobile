import 'package:farmerlocalmobile/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/routes.dart';
import 'core/utils/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await configureInjection(environment: Env.DEV);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late final _navigatorKey = GlobalKey<NavigatorState>();
  late final _appRouter = AppRouter(_navigatorKey);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Nyandarua Rabbitries',
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,
          textTheme: TextTheme(),
          titleTextStyle: TextStyle(color: Colors.white),
          centerTitle: true,
        ),
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
      ),
    );
  }
}
