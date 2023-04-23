
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/routing/domain/models/menu_model.dart';
import 'package:voleep_carclean_frontend/routing/presentation/menus/menu_list_controller.dart';

final menuListProvider =
    StateNotifierProvider<MenuListController, List<MenuModel>>(
  (ref) => MenuListController(),
);
