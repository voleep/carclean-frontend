import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/app_page/home/home_view.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer-list/customer_search_page.dart';
import 'package:voleep_carclean_frontend/modules/employee/presentation/employee_search/employee_search_page.dart';
import 'package:voleep_carclean_frontend/modules/product/presentation/product_search/product_search_page.dart';
import 'package:voleep_carclean_frontend/modules/service/presentation/service_search/service_search_page.dart';
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
            location: Routes.app.product.root,
            label: 'Produtos',
            icon: Icons.store_rounded,
            child: ProductSearchPage(),
          ),
          MenuModel(
            location: Routes.app.service.root,
            label: 'Serviços',
            icon: Icons.settings_suggest_rounded,
            child: const ServiceSearchPage(),
          ),
          MenuModel(
            location: Routes.app.vehicle.root,
            label: 'Veículos',
            icon: Icons.directions_car_rounded,
            child: VehicleListPage(),
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
            location: Routes.app.employee.root,
            label: 'Colaboradores',
            icon: Icons.diversity_3_rounded,
            child: EmployeeSearchPage(),
          ),
        ]);
}
