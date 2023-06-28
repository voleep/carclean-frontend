import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/app_page/app_page.dart';
import 'package:voleep_carclean_frontend/routing/presentation/menus/providers/menu_list_controller_provider.dart';
import 'package:voleep_carclean_frontend/routing/routes/customer/customer_routes.dart';
import 'package:voleep_carclean_frontend/routing/routes/product/product_routes.dart';
import 'package:voleep_carclean_frontend/routing/routes/vehicle/vehicle_routes.dart';

class AppRoutes {
  final navigatorKey = GlobalKey<NavigatorState>();

  static String name = "app";
  final String root;

  get home => "$root/home";

  get customer => CustomerRoutes.forChild(parentPath: root);
  get vehicle => VehicleRoutes.forChild(parentPath: root);
  get product => ProductRoutes.forChild(parentPath: root);

  AppRoutes.forChild({
    required String parentPath,
  }) : root = "$parentPath/$name";

  List<RouteBase> routes(Ref ref) => [
        ...customer.routes,
        ...vehicle.routes,
        ...product.routes,
        ShellRoute(
          navigatorKey: navigatorKey,
          builder: (context, state, child) => AppPage(
            child: child,
          ),
          routes: ref
              .read(menuListProvider)
              .map(
                (menu) => GoRoute(
                  parentNavigatorKey: navigatorKey,
                  path: menu.location,
                  builder: (context, state) => menu.child,
                  pageBuilder: (context, state) => CustomTransitionPage(
                    child: menu.child,
                    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ];
}
