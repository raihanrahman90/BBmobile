import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        // Auth
        AutoRoute(page: SplashRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),

        // Main
        AutoRoute(
          page: MainRoute.page,
          guards: [AuthGuard()],
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: TransactionRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
          initial: true,
        ),

        AutoRoute(page: CartRoute.page),
        AutoRoute(page: DetailRoute.page),
        AutoRoute(page: PayRoute.page),
      ];
}

class AuthGuard extends AutoRouteGuard {
  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final routeName = resolver.route.name;

    final token = await _getToken();
    if (token != null) {
      resolver.next();
    } else if (routeName == LoginRoute.name ||
        routeName == RegisterRoute.name) {
      resolver.next();
    } else {
      resolver.redirect(const LoginRoute());
    }
  }
}
