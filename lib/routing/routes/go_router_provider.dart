import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_state_provider.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final goRouter = GoRouter(
    navigatorKey: Routes.i.navigationkey,
    initialLocation: Routes.app.home,
    redirect: (context, state) {
      if (state.location.isEmpty || state.location == "/") {
        return Routes.app.home;
      }

      return null;
    },
    routes: Routes.i.routes(ref),
  );

  ref.listen(
    oAuthStateProvider,
    (_, state) {
      final isAppRoute = goRouter.location.startsWith(Routes.app.root) || goRouter.location == '/';

      final isAuthRoute = goRouter.location.startsWith(Routes.login.root);

      final userId = state.value?.userId;
      final businessId = state.value?.businessId;

      if (isAppRoute) {
        if (userId == null) {
          return goRouter.go(Routes.login.root);
        }
      }

      if (isAuthRoute) {
        if (userId != null && businessId != null) {
          return goRouter.go(Routes.app.home);
        }
      }

      if (isAppRoute || isAuthRoute) {
        if (userId != null && businessId == null) {
          return goRouter.go(Routes.login.createBusiness);
        }
      }
    },
  );

  return goRouter;
});
