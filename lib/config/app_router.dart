import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        // Auth
        AutoRoute(page: SplashRoute.page),
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: RegisterRoute.page),

        // Main
        AutoRoute(
          page: MainRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: TransactionRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),

      AutoRoute(page: CartRoute.page),
      AutoRoute(page: DetailRoute.page),
      AutoRoute(page: PayRoute.page),
      ];
}
