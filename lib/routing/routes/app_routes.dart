import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/app_page/app_page.dart';
import 'package:voleep_carclean_frontend/routing/presentation/menus/providers/menu_list_controller_provider.dart';
import 'package:voleep_carclean_frontend/routing/routes/customer/customer_routes.dart';
import 'package:voleep_carclean_frontend/routing/routes/employee/employee_routes.dart';
import 'package:voleep_carclean_frontend/routing/routes/product/product_routes.dart';
import 'package:voleep_carclean_frontend/routing/routes/serviceorder/service_order_routes.dart';
import 'package:voleep_carclean_frontend/routing/routes/vehicle/vehicle_routes.dart';

class AppRoutes {
  final navigatorKey = GlobalKey<NavigatorState>();

  static String name = "app";
  final String root;

  String get home => "$root/home";

  CustomerRoutes get customer => CustomerRoutes.forChild(parentPath: root);
  VehicleRoutes get vehicle => VehicleRoutes.forChild(parentPath: root);
  ProductRoutes get product => ProductRoutes.forChild(parentPath: root);
  EmployeeRoutes get employee => EmployeeRoutes.forChild(parentPath: root);
  ServiceOrderRoutes get serviceOrder => ServiceOrderRoutes.forChild(parentPath: root);

  AppRoutes.forChild({
    required String parentPath,
  }) : root = "$parentPath/$name";

  List<RouteBase> routes(Ref ref) => [
        ...customer.routes,
        ...vehicle.routes,
        ...product.routes,
        ...employee.routes,
        ...serviceOrder.routes,
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
