import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/app_page/home/home_view.dart';
import 'package:voleep_carclean_frontend/modules/customers/presentation/customer-list/customer_search_page.dart';
import 'package:voleep_carclean_frontend/modules/vehicles/pages/vehicles_page.dart';
import 'package:voleep_carclean_frontend/routing/domain/models/menu_model.dart';

class MenuListController extends StateNotifier<List<MenuModel>> {
  final List<MenuModel> menuList;

  MenuListController(
      {this.menuList = const [
        MenuModel(
            location: '/app/home',
            label: 'Início',
            icon: Icon(Icons.home_rounded),
            child: HomeView()),
        MenuModel(
          location: '/app/customer',
          label: 'Clientes',
          icon: Icon(Icons.group_outlined),
          child: CustomerSearchPage(),
        ),
        MenuModel(
            location: '/app/vehicle',
            label: 'veículos',
            icon: Icon(Icons.commute_outlined),
            child: VehiclesPage()),
        MenuModel(
            location: '/app/vehicle',
            label: 'veículos',
            icon: Icon(Icons.commute_outlined),
            child: VehiclesPage()),
      ]})
      : super(menuList);
}
