import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_state_provider.dart';
import 'package:voleep_carclean_frontend/modules/app/app_routes.dart';
import 'package:voleep_carclean_frontend/modules/oauth/oauth_routes.dart';

import '../../modules/oauth/presentation/login/login_page.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final goRouter = GoRouter(
    initialLocation: '/app/home',
    redirect: (context, state) {
      if (state.location.isEmpty || state.location == "/") {
        return "/app/home";
      }

      return null;
    },
    routes: [
      GoRoute(
        path: "/login",
        builder: (context, state) => const LoginPage(),
        routes: oauthRoutes,
      ),
      ...ref.watch(appRoutesProvider)
    ],
  );

  ref.listen(
    oAuthStateProvider,
    (_, state) {
      final isAppRoute =
          goRouter.location.startsWith('/app') || goRouter.location == '/';

      final isAuthRoute = goRouter.location.startsWith("/login");

      final userId = state.value?.userId;
      final businessId = state.value?.businessId;

      if (isAppRoute) {
        if (userId == null) {
          return goRouter.go("/login");
        }
      }

      if (isAuthRoute) {
        if (userId != null && businessId != null) {
          return goRouter.go("/app/home");
        }
      }

      if (isAppRoute || isAuthRoute) {
        if (userId != null && businessId == null) {
          return goRouter.go("/login/create-business");
        }
      }
    },
  );

  return goRouter;
});
