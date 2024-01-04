import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/routing/menu/menu.dart';
import 'package:voleep_carclean_frontend/core/routing/menus.dart';

part 'user_menus.g.dart';

@Riverpod(keepAlive: true)
class UserMenus extends _$UserMenus {
  @override
  List<Menu> build() {
    return ref.read(menusProvider);
  }
}
