import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/root_page/root_page.dart';
import 'package:voleep_carclean_frontend/routing/routes/app_routes.dart';
import 'package:voleep_carclean_frontend/routing/routes/login_routes.dart';

class Routes {
  final navigationkey = GlobalKey<NavigatorState>();

  static AppRoutes app = AppRoutes.forChild(parentPath: "");
  static LoginRoutes login = LoginRoutes.forChild(parentPath: "");

  static Routes? _instance;
  static Routes get i => _instance ??= Routes._();
  Routes._();

  List<RouteBase> routes(Ref ref) => [
        ...login.routes,
        ShellRoute(
          navigatorKey: navigationkey,
          builder: (context, state, child) => RootPage(
            child: child,
          ),
          routes: app.routes(ref),
        ),
      ];
}
