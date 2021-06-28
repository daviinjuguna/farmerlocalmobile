import 'package:auto_route/auto_route.dart';
import 'package:farmerlocalmobile/core/routes/routes.dart';
import 'package:farmerlocalmobile/di/injection.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/splash/splash_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SplashBloc>()..add(SplashAuth()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLoggedOut) {
            WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
              AutoRouter.of(context).replace(LoginRoute());
            });
          }
          if (state is SplashSuccess) {
            WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
              AutoRouter.of(context).replace(HomeRoute());
            });
          }
        },
        child: Scaffold(
          body: Container(),
        ),
      ),
    );
  }
}
