import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/routing/menus/menu_list.dart';
import 'package:voleep_carclean_frontend/routing/routes/customer/customer_routes.dart';
import 'package:voleep_carclean_frontend/routing/routes/employee/employee_routes.dart';
import 'package:voleep_carclean_frontend/routing/routes/product/product_routes.dart';
import 'package:voleep_carclean_frontend/routing/routes/service/service_routes.dart';
import 'package:voleep_carclean_frontend/routing/routes/service_order/service_order_routes.dart';
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
  ServiceRoutes get service => ServiceRoutes.forChild(parentPath: root);
  ServiceOrderRoutes get serviceOrder =>
      ServiceOrderRoutes.forChild(parentPath: root);

  AppRoutes.forChild({
    required String parentPath,
  }) : root = "$parentPath/$name";

  List<StatefulShellBranch> branches(Ref ref) => ref
      .read(menuListProvider)
      .map(
        (menu) => StatefulShellBranch(
          navigatorKey: menu.navigatorKey,
          routes: [
            GoRoute(
                path: menu.location,
                pageBuilder: (context, state) => NoTransitionPage(
                      child: menu.child,
                    )),
          ],
        ),
      )
      .toList();

  List<RouteBase> get routes => [
        ...customer.routes,
        ...vehicle.routes,
        ...product.routes,
        ...employee.routes,
        ...service.routes,
        ...serviceOrder.routes
      ];
}
