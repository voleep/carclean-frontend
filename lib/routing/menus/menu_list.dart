import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/app_page/home/home_view.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer-search/customer_search_page.dart';
import 'package:voleep_carclean_frontend/modules/employee/presentation/employee_search/employee_search_page.dart';
import 'package:voleep_carclean_frontend/modules/product/presentation/product_search/product_search_page.dart';
import 'package:voleep_carclean_frontend/modules/service/presentation/service_search/service_search_page.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/list/vehicle_list_page.dart';
import 'package:voleep_carclean_frontend/routing/domain/models/menu_model.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';

part 'menu_list.g.dart';

final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorProductKey = GlobalKey<NavigatorState>(debugLabel: 'shellProduct');
final _shellNavigatorServiceKey = GlobalKey<NavigatorState>(debugLabel: 'shellService');
final _shellNavigatorVehicleKey = GlobalKey<NavigatorState>(debugLabel: 'shellVehicle');
final _shellNavigatorCustomerKey = GlobalKey<NavigatorState>(debugLabel: 'shellCustomer');
final _shellNavigatorEmployeeKey = GlobalKey<NavigatorState>(debugLabel: 'shellEmployee');

@Riverpod(keepAlive: true)
List<MenuModel> menuList(MenuListRef ref) => [
      MenuModel(
        location: Routes.app.home,
        navigatorKey: _shellNavigatorHomeKey,
        label: 'Início',
        icon: Icons.home_rounded,
        child: const HomeView(),
      ),
      MenuModel(
        location: Routes.app.product.root,
        navigatorKey: _shellNavigatorProductKey,
        label: 'Produtos',
        icon: Icons.store_rounded,
        child: ProductSearchPage(),
      ),
      MenuModel(
        location: Routes.app.service.root,
        navigatorKey: _shellNavigatorServiceKey,
        label: 'Serviços',
        icon: Icons.settings_suggest_rounded,
        child: const ServiceSearchPage(),
      ),
      MenuModel(
        location: Routes.app.vehicle.root,
        navigatorKey: _shellNavigatorVehicleKey,
        label: 'Veículos',
        icon: Icons.directions_car_rounded,
        child: VehicleListPage(),
      ),
      MenuModel(
        location: Routes.app.customer.root,
        navigatorKey: _shellNavigatorCustomerKey,
        label: 'Clientes',
        icon: Icons.group_outlined,
        child: const CustomerSearchPage(),
      ),
      MenuModel(
        location: Routes.app.employee.root,
        navigatorKey: _shellNavigatorEmployeeKey,
        label: 'Colaboradores',
        icon: Icons.diversity_3_rounded,
        child: EmployeeSearchPage(),
      ),
    ];