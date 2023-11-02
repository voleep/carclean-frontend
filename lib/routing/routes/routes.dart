import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/app_page/app_page.dart';
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
        ...app.routes,
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => AppPage(
            navigationShell: navigationShell,
          ),
          branches: app.branches(ref),
        ),
      ];
}
