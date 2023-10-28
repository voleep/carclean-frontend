import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_state_provider.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final goRouter = GoRouter(
    initialLocation: Routes.app.home,
    navigatorKey: Routes.i.navigationkey,
    redirect: (context, state) {
      final location = state.uri.toString();
      if (location == "" || location == "/") {
        return Routes.app.home;
      }

      return null;
    },
    routes: Routes.i.routes(ref),
  );

  ref.listen(oAuthStateProvider, (_, state) {
    final location = goRouter.routerDelegate.currentConfiguration.uri.toString();
    final userId = state.value?.userId;
    final businessId = state.value?.businessId;

    final isAuthRoute = location.startsWith(Routes.login.root);

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
  });

  return goRouter;
});
