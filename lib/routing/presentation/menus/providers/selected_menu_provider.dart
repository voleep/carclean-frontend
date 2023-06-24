import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/routing/domain/models/menu_model.dart';
import 'package:voleep_carclean_frontend/routing/presentation/menus/providers/menu_controller_provider.dart';
import 'package:voleep_carclean_frontend/routing/presentation/menus/providers/menu_list_controller_provider.dart';

final selectedMenuProvider = Provider<MenuModel>((ref) {
  final menuList = ref.watch(menuListProvider);
  final selectedIndex = ref.watch(menuControllerProvider);

  return menuList[selectedIndex];
});
