import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_state_provider.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final goRouter = GoRouter(
    navigatorKey: Routes.i.navigationkey,
    redirect: (context, state) {
      if (state.matchedLocation == "/") {
        return Routes.app.home;
      }

      return null;
    },
    routes: Routes.i.routes(ref),
  );

  ref.listen(oAuthStateProvider, (_, state) {
    final fullPath = goRouter.routerDelegate.currentConfiguration.fullPath;
    final userId = state.value?.userId;
    final businessId = state.value?.businessId;

    final isAuthRoute = fullPath.startsWith(Routes.login.root);

    if (!isAuthRoute) {
      if (userId == null) {
        return goRouter.go(Routes.login.root);
      }
    }

    if (isAuthRoute) {
      if (userId != null && businessId != null) {
        return goRouter.go(Routes.app.home);
      }
    }

    if (userId != null && businessId == null) {
      return goRouter.go(Routes.login.createBusiness);
    }
  }, fireImmediately: true);

  return goRouter;
});
