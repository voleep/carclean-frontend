import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/app_page/app_page.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/root_page/root_page.dart';
import 'package:voleep_carclean_frontend/modules/customers/domain/typedefs/customer_id.dart';
import 'package:voleep_carclean_frontend/modules/customers/presentation/customer-form/customer_page.dart';
import 'package:voleep_carclean_frontend/routing/presentation/menus/providers/menu_list_controller_provider.dart';

final _appNavigatorKey = GlobalKey<NavigatorState>();

final _rootNavigationkey = GlobalKey<NavigatorState>();

final appRoutesProvider = Provider<List<RouteBase>>((ref) => [
      ShellRoute(
        navigatorKey: _rootNavigationkey,
        builder: (context, state, child) => RootPage(
          child: child,
        ),
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavigationkey,
            path: "/app/customer/:id",
            pageBuilder: (context, state) {
              final CustomerId? customerId = state.params['id'];

              return NoTransitionPage(
                child: CustomersPage(
                  customerId: customerId,
                ),
              );
            },
          ),
          ShellRoute(
            navigatorKey: _appNavigatorKey,
            builder: (context, state, child) => AppPage(
              child: child,
            ),
            routes: ref
                .read(menuListProvider)
                .map(
                  (menu) => GoRoute(
                    parentNavigatorKey: _appNavigatorKey,
                    path: menu.location,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: menu.child,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    ]);
