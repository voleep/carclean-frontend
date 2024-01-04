import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/app_routes.dart';
import 'package:voleep_carclean_frontend/core/routing/menu/menu.dart';
import 'package:voleep_carclean_frontend/core/routing/menu/menu_group.dart';
import 'package:voleep_carclean_frontend/modules/customer/customer_routes.dart';
import 'package:voleep_carclean_frontend/modules/employee/employee_routes.dart';
import 'package:voleep_carclean_frontend/modules/product/product_routes.dart';
import 'package:voleep_carclean_frontend/modules/service/service_routes.dart';
import 'package:voleep_carclean_frontend/modules/service_order/service_order_routes.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/vehicle_routes.dart';

part 'menus.g.dart';

@Riverpod(keepAlive: true)
List<Menu> menus(MenusRef ref) => [
      Menu(
        path: AppRoutes.home,
        group: MenuGroup.home,
        title: 'Início',
        icon: Icons.home_rounded,
      ),
      Menu(
        path: ServiceOrderRoutes.list,
        title: 'OS',
        icon: Icons.construction_rounded,
        group: MenuGroup.home,
      ),
      Menu(
        path: CustomerRoutes.list,
        group: MenuGroup.registeration,
        title: 'Clientes',
        icon: Icons.group_outlined,
      ),
      Menu(
        path: ProductRoutes.list,
        title: 'Produtos',
        icon: Icons.category_rounded,
        group: MenuGroup.registeration,
      ),
      Menu(
        path: EmployeeRoutes.list,
        title: 'Colaboradores',
        icon: Icons.diversity_3_rounded,
        group: MenuGroup.registeration,
      ),
      Menu(
        path: ServiceRoutes.list,
        group: MenuGroup.registeration,
        title: 'Serviços',
        icon: Icons.settings_suggest_rounded,
      ),
      Menu(
        path: VehicleRoutes.list,
        title: 'Veículos',
        icon: Icons.local_car_wash_rounded,
        group: MenuGroup.registeration,
      ),
    ];
