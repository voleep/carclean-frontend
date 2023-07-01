import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/routing/domain/models/menu_model.dart';
import 'package:voleep_carclean_frontend/routing/menus/menu_controller.dart';

part 'selected_menu.g.dart';

@riverpod
MenuModel selectedMenu(SelectedMenuRef ref) => ref.watch(menuControllerProvider);
