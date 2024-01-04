import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/core/extensions/go_router_extension.dart';
import 'package:voleep_carclean_frontend/core/routing/favorite_menus.dart';
import 'package:voleep_carclean_frontend/core/routing/go_router.dart';
import 'package:voleep_carclean_frontend/core/routing/menu/menu_list_extension.dart';
import 'package:voleep_carclean_frontend/core/routing/user_menus.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final curPath = ref.read(goRouterProvider).currentPath;
    final userMenus = ref.read(userMenusProvider);
    final favoriteMenus = List.of(ref.watch(favoriteMenusProvider));

    if (favoriteMenus.noneWithPath(curPath) && userMenus.anyWithPath(curPath)) {
      favoriteMenus.removeLast();
      favoriteMenus.add(userMenus.firstWithPath(curPath)!);
    }

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: NavigationBar(
        selectedIndex: favoriteMenus.indexOfPath(curPath),
        destinations: favoriteMenus
            .map((menu) => NavigationDestination(
                  icon: Icon(menu.icon),
                  label: menu.title,
                ))
            .toList(),
        onDestinationSelected: (index) {
          final menu = favoriteMenus[index];
          context.go(menu.path);
        },
      ),
    );
  }
}
