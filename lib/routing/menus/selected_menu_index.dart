import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/routing/menus/menu_controller.dart';
import 'package:voleep_carclean_frontend/routing/menus/menu_list.dart';

part 'selected_menu_index.g.dart';

@riverpod
int selectedMenuIndex(SelectedMenuIndexRef ref) {
  final menuList = ref.read(menuListProvider);
  final menuController = ref.watch(menuControllerProvider);
  return menuList.indexOf(menuController);
}
