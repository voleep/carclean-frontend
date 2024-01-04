import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/routing/menu/menu.dart';
import 'package:voleep_carclean_frontend/core/routing/user_menus.dart';

part 'favorite_menus.g.dart';

@Riverpod(keepAlive: true)
class FavoriteMenus extends _$FavoriteMenus {
  @override
  List<Menu> build() {
    return ref.watch(userMenusProvider).sublist(0, 4);
  }
}
