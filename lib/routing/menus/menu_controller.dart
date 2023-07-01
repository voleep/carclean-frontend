import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/routing/domain/models/menu_model.dart';
import 'package:voleep_carclean_frontend/routing/menus/menu_list.dart';
import 'package:voleep_carclean_frontend/routing/routes/go_router_provider.dart';
part 'menu_controller.g.dart';

@Riverpod(keepAlive: true)
class MenuController extends _$MenuController {
  @override
  MenuModel build() {
    final menuList = ref.read(menuListProvider);
    final goRouter = ref.read(goRouterProvider);

    goRouter.addListener(_onRouteHasChanged);
    ref.onDispose(() {
      goRouter.removeListener(_onRouteHasChanged);
    });

    return menuList[0];
  }

  void _onRouteHasChanged() {
    final menuList = ref.read(menuListProvider);
    final goRouter = ref.read(goRouterProvider);

    final String location = goRouter.location;
    final int menuIndex = menuList.indexWhere(
      (menu) => location.startsWith(menu.location),
    );

    final safeMenuIndex = menuIndex < 0 ? 0 : menuIndex;

    final MenuModel selectedMenu = menuList[safeMenuIndex];

    if (selectedMenu.location != state.location) {
      state = menuList[safeMenuIndex];
    }
  }

  void onMenuSelected({required int selectedIndex}) {
    final menuList = ref.read(menuListProvider);
    final goRouter = ref.read(goRouterProvider);

    if (menuList[selectedIndex].location != state.location) {
      goRouter.go(menuList[selectedIndex].location);
    }
  }
}
