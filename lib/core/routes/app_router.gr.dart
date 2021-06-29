// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../features/domain/entities/breeders.dart' as _i8;
import '../../features/presentation/pages/auth/login_page.dart' as _i4;
import '../../features/presentation/pages/auth/register_page.dart' as _i5;
import '../../features/presentation/pages/home/home_page.dart' as _i6;
import '../../features/presentation/pages/home/widgets/add_breeder_widget.dart'
    as _i7;
import '../../features/presentation/pages/splash/splash_page.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.SplashPage();
        }),
    LoginRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.LoginPage();
        }),
    RegisterRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.RegisterPage();
        }),
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.HomePage();
        }),
    AddBreederWidget.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<AddBreederWidgetArgs>(
              orElse: () => const AddBreederWidgetArgs());
          return _i7.AddBreederWidget(
              key: args.key,
              farm: args.farm,
              weight: args.weight,
              gender: args.gender,
              age: args.age,
              image: args.image,
              breeders: args.breeders);
        },
        fullscreenDialog: true)
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashRoute.name, path: '/'),
        _i1.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i1.RouteConfig(RegisterRoute.name, path: '/register-page'),
        _i1.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i1.RouteConfig(AddBreederWidget.name, path: '/add-breeder-widget')
      ];
}

class SplashRoute extends _i1.PageRouteInfo {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/login-page');

  static const String name = 'LoginRoute';
}

class RegisterRoute extends _i1.PageRouteInfo {
  const RegisterRoute() : super(name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home-page');

  static const String name = 'HomeRoute';
}

class AddBreederWidget extends _i1.PageRouteInfo<AddBreederWidgetArgs> {
  AddBreederWidget(
      {_i2.Key? key,
      String? farm,
      double? weight,
      bool? gender,
      int? age,
      String? image,
      _i8.Breeders? breeders})
      : super(name,
            path: '/add-breeder-widget',
            args: AddBreederWidgetArgs(
                key: key,
                farm: farm,
                weight: weight,
                gender: gender,
                age: age,
                image: image,
                breeders: breeders));

  static const String name = 'AddBreederWidget';
}

class AddBreederWidgetArgs {
  const AddBreederWidgetArgs(
      {this.key,
      this.farm,
      this.weight,
      this.gender,
      this.age,
      this.image,
      this.breeders});

  final _i2.Key? key;

  final String? farm;

  final double? weight;

  final bool? gender;

  final int? age;

  final String? image;

  final _i8.Breeders? breeders;
}
