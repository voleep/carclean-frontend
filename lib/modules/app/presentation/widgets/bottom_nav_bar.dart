import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/routing/menus/menu_list.dart';
import 'package:voleep_carclean_frontend/routing/menus/selected_menu_index.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    super.key,
    this.onDestinationSelected,
  });

  final void Function(int)? onDestinationSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: destinations
            .map(
              (menu) => NavigationDestination(
                icon: Icon(menu.icon),
                label: menu.label,
              ),
            )
            .toList(),
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
