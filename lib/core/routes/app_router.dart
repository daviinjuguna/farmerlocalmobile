import 'package:auto_route/auto_route.dart';
import 'package:farmerlocalmobile/features/presentation/pages/auth/login_page.dart';
import 'package:farmerlocalmobile/features/presentation/pages/auth/register_page.dart';
import 'package:farmerlocalmobile/features/presentation/pages/details/detail_page.dart';
import 'package:farmerlocalmobile/features/presentation/pages/home/home_page.dart';
import 'package:farmerlocalmobile/features/presentation/pages/home/widgets/add_breeder_widget.dart';
import 'package:farmerlocalmobile/features/presentation/pages/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <MaterialRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: LoginPage),
    MaterialRoute(page: RegisterPage),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: AddBreederWidget, fullscreenDialog: true),
    MaterialRoute(page: DetailsPage)
  ],
)
class $AppRouter {}
