import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/routing/domain/models/menu_model.dart';
import 'package:voleep_carclean_frontend/routing/domain/typedefs/selected_menu.dart';

class MenuController extends StateNotifier<SelectedMenuIndex> {
  final List<MenuModel> menuList;

  final GoRouter goRouter;

  MenuController({required this.menuList, required this.goRouter}) : super(0) {
    goRouter.addListener(() {
      _onRouteHasChanged();
    });
    _onRouteHasChanged();
  }

  void _onRouteHasChanged() {
    final String location = goRouter.location;
    final int menuIndex = menuList.indexWhere(
      (menu) => location.startsWith(menu.location),
    );

    final safeMenuIndex = menuIndex < 0 ? 0 : menuIndex;

    final MenuModel selectedMenu = menuList[safeMenuIndex];

    if (selectedMenu.location != menuList[state].location) {
      state = safeMenuIndex;
    }
  }

  void onMenuSelected({required int selectedIndex}) {
    if (menuList[selectedIndex].location != menuList[state].location) {
      goRouter.go(menuList[selectedIndex].location);
    }
  }
}
