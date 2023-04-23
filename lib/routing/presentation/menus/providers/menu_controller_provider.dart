import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/routing/domain/typedefs/selected_menu.dart';
import 'package:voleep_carclean_frontend/routing/presentation/menus/menu_controller.dart';
import 'package:voleep_carclean_frontend/routing/presentation/menus/providers/menu_list_controller_provider.dart';
import 'package:voleep_carclean_frontend/routing/routes/go_router_provider.dart';

final menuControllerProvider =
    StateNotifierProvider<MenuController, SelectedMenuIndex>(
  (ref) => MenuController(
    menuList: ref.watch(menuListProvider),
    goRouter: ref.watch(goRouterProvider),
  ),
);
