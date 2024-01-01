import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/menu_drawer/menu_drawer.dart';
import 'package:voleep_carclean_frontend/routing/menus/menu_list.dart';
import 'package:voleep_carclean_frontend/routing/menus/selected_menu_index.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';
import 'package:voleep_carclean_frontend/shared/widgets/loading/loading_screen.dart';

final appScaffoldState = GlobalKey<ScaffoldState>();

class AppPage extends StatelessWidget {
  const AppPage({Key? key, required this.navigationShell})
      : super(key: key ?? const ValueKey('AppPage'));

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Scaffold(
      key: appScaffoldState,
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      extendBodyBehindAppBar: true,
      body: navigationShell,
      endDrawer: const MenuDrawer(),
      bottomNavigationBar: Visibility(
        visible: isMobile,
        child: Consumer(builder: (_, ref, child) {
          ref.listen<bool>(
            isLoadingProvider,
            (_, isLoading) {
              if (isLoading) {
                LoadingScreen.instance().show(context: context);
              } else {
                LoadingScreen.instance().hide();
              }
            },
          );

          int selectedIndex = ref.watch(selectedMenuIndexProvider);
          int menuLenght = 4;

          final menuList = ref.watch(menuListProvider);

          final destinations = menuList.sublist(0, menuLenght).toList();

          final hasSelectedFromRoot = selectedIndex >= menuLenght;
          if (hasSelectedFromRoot) {
            destinations.removeLast();
            destinations.add(menuList[selectedIndex]);
            selectedIndex = menuLenght - 1;
          }

          return NavigationBar(
            selectedIndex: selectedIndex,
            destinations: destinations
                .map(
                  (menu) => NavigationDestination(
                    icon: Icon(menu.icon),
                    label: menu.label,
                  ),
                )
                .toList(),
            onDestinationSelected: _goBranch,
          );
        }),
      ),
    );
  }
}
