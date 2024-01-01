import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer_list/customer_list_page.dart';
import 'package:voleep_carclean_frontend/modules/employee/presentation/employee_list/employee_list_page.dart';
import 'package:voleep_carclean_frontend/modules/product/presentation/product_list/product_list_page.dart';
import 'package:voleep_carclean_frontend/modules/service/presentation/service_list/service_list_page.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_search/service_order_search_page.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/vehicle_list/vehicle_list_page.dart';
import 'package:voleep_carclean_frontend/routing/domain/enums/menu_group.dart';
import 'package:voleep_carclean_frontend/routing/domain/models/menu_model.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';

part 'menu_list.g.dart';

final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorProductKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellProduct');
final _shellNavigatorServiceKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellService');
final _shellNavigatorVehicleKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellVehicle');
final _shellNavigatorCustomerKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellCustomer');
final _shellNavigatorEmployeeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellEmployee');
final _shellNavigatorServiceOrderKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellServiceOrder');

@Riverpod(keepAlive: true)
List<MenuModel> menuList(MenuListRef ref) => [
      MenuModel(
        group: MenuGroup.home,
        location: Routes.app.home,
        navigatorKey: _shellNavigatorHomeKey,
        label: 'Início',
        icon: Icons.home_rounded,
        child: const CustomerListPage(),
      ),
      MenuModel(
        group: MenuGroup.home,
        location: Routes.app.serviceOrder.root,
        navigatorKey: _shellNavigatorServiceOrderKey,
        label: 'OS',
        icon: Icons.construction_rounded,
        child: const ServiceOrderSearchPage(),
      ),
      MenuModel(
        group: MenuGroup.register,
        location: Routes.app.customer.root,
        navigatorKey: _shellNavigatorCustomerKey,
        label: 'Clientes',
        icon: Icons.group_outlined,
        child: const CustomerListPage(),
      ),
      MenuModel(
        group: MenuGroup.register,
        location: Routes.app.product.root,
        navigatorKey: _shellNavigatorProductKey,
        label: 'Produtos',
        icon: Icons.category_rounded,
        child: ProductListPage(),
      ),
      MenuModel(
        group: MenuGroup.register,
        location: Routes.app.service.root,
        navigatorKey: _shellNavigatorServiceKey,
        label: 'Serviços',
        icon: Icons.settings_suggest_rounded,
        child: ServiceListPage(),
      ),
      MenuModel(
        group: MenuGroup.register,
        location: Routes.app.vehicle.root,
        navigatorKey: _shellNavigatorVehicleKey,
        label: 'Veículos',
        icon: Icons.local_car_wash_rounded,
        child: VehicleListPage(),
      ),
      MenuModel(
        group: MenuGroup.register,
        location: Routes.app.employee.root,
        navigatorKey: _shellNavigatorEmployeeKey,
        label: 'Colaboradores',
        icon: Icons.diversity_3_rounded,
        child: EmployeeListPage(),
      ),
    ];
