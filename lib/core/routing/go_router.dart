import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/app_routes.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_session.dart';

part 'go_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final goRouter = GoRouter(
    initialLocation: AppRoutes.home,
    redirect: (context, state) {
      final authLocations = [
        AppRoutes.login,
        AppRoutes.register,
        AppRoutes.registerBusiness,
        AppRoutes.forgetPass,
      ];

      final location = state.uri.toString();

      final session = ref.read(oAuthSessionProvider);
      final userId = session.value?.userId;
      final businessId = session.value?.businessId;

      final authLocation = authLocations.any((r) => r.startsWith(location));
      final isAuthorized = userId != null;
      final hasBusiness = businessId != null;

      if (!authLocation && !isAuthorized) {
        return AppRoutes.login;
      }

      if (authLocation && isAuthorized && hasBusiness) {
        return AppRoutes.home;
      }

      if (authLocation && isAuthorized && !hasBusiness) {
        return AppRoutes.registerBusiness;
      }

      return null;
    },
    routes: appRoutes,
  );

  ref.listen(oAuthSessionProvider, (_, __) => goRouter.refresh());

  return goRouter;
}
