import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer_list/customer_list_page.dart';
import 'package:voleep_carclean_frontend/modules/employee/presentation/employee_list/employee_list_page.dart';
import 'package:voleep_carclean_frontend/modules/home/presentation/home_page.dart';
import 'package:voleep_carclean_frontend/modules/product/presentation/product_list/product_list_page.dart';
import 'package:voleep_carclean_frontend/modules/service/presentation/service_list/service_list_page.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_search/service_order_search_page.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/vehicle_list/vehicle_list_page.dart';

final homeBranches = [
  StatefulShellBranch(
    //navigatorKey: ,
    routes: [
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: HomePage(),
        ),
      ),
    ],
  ),
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: '/ordem-servicos',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ServiceOrderSearchPage(),
        ),
      ),
    ],
  ),
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: '/clientes',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CustomerListPage(),
        ),
      ),
    ],
  ),
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: '/colaboradores',
        pageBuilder: (context, state) => NoTransitionPage(
          child: EmployeeListPage(),
        ),
      ),
    ],
  ),
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: '/produtos',
        pageBuilder: (context, state) => NoTransitionPage(
          child: ProductListPage(),
        ),
      ),
    ],
  ),
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: '/servicos',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ServiceListPage(),
        ),
      ),
    ],
  ),
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: '/veiculos',
        pageBuilder: (context, state) => NoTransitionPage(
          child: VehicleListPage(),
        ),
      ),
    ],
  ),
];
