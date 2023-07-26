import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_state_provider.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/menu_drawer/menu_drawer.dart';
import 'package:voleep_carclean_frontend/routing/menus/menu_list.dart';
import 'package:voleep_carclean_frontend/routing/menus/selected_menu_index.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';
import 'package:voleep_carclean_frontend/shared/widgets/loading/loading_screen.dart';

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
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      extendBodyBehindAppBar: true,
      body: navigationShell,
      endDrawer: Consumer(builder: (context, ref, child) {
        return Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          const MenuDrawer(),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: 280,
            height: 50,
            child: TextButton.icon(
              icon: const Icon(Icons.logout_rounded),
              onPressed: () {
                ref.read(oAuthStateProvider.notifier).logout();
              },
              label: const Text("Fazer logout"),
            ),
          )
        ]);
      }),
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
