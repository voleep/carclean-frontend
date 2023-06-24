import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/app_page/home/home_view.dart';
import 'package:voleep_carclean_frontend/modules/customers/presentation/customer-list/customer_search_page.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/list/vehicle_list_page.dart';
import 'package:voleep_carclean_frontend/routing/domain/models/menu_fab_options_model.dart';
import 'package:voleep_carclean_frontend/routing/domain/models/menu_model.dart';
import 'package:voleep_carclean_frontend/routing/routes/go_router_provider.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';

class MenuListController extends StateNotifier<List<MenuModel>> {
  MenuListController()
      : super([
          MenuModel(
            location: Routes.app.home,
            label: 'Início',
            icon: Icons.home_rounded,
            child: const HomeView(),
          ),
          MenuModel(
            location: Routes.app.customer.root,
            label: 'Clientes',
            icon: Icons.group_outlined,
            child: const CustomerSearchPage(),
            fabOptions: MenuFabOptionsModel(onPressed: (ref) {
              ref.read(goRouterProvider).push(Routes.app.customer.create);
            }),
          ),
          MenuModel(
              location: Routes.app.vehicle.root,
              label: 'Veículos',
              icon: Icons.directions_car_rounded,
              child: VehicleListPage(),
              fabOptions: MenuFabOptionsModel(onPressed: (ref) {
                ref.read(goRouterProvider).push(Routes.app.vehicle.create);
              })),
          MenuModel(
            location: '/app/vehicle',
            label: 'veículos',
            icon: Icons.commute_outlined,
            child: VehicleListPage(),
          ),
        ]);
}
