import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/routing/menus/menu_controller.dart';
import 'package:voleep_carclean_frontend/routing/menus/menu_list.dart';
import 'package:voleep_carclean_frontend/routing/menus/selected_menu_index.dart';

class MenuDrawer extends ConsumerWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 280,
      child: NavigationDrawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        selectedIndex: ref.watch(selectedMenuIndexProvider),
        onDestinationSelected: (selectedIndex) {
          ref.read(menuControllerProvider.notifier).onMenuSelected(selectedIndex: selectedIndex);
          Scaffold.of(context).closeEndDrawer();
        },
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 20, 16, 20),
            child: Text(
              'CarClean',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.primary),
            ),
          ),
          ...ref
              .read(menuListProvider)
              .asMap()
              .entries
              .map(
                (menuEntry) => NavigationDrawerDestination(
                  label: Text(menuEntry.value.label),
                  icon: Icon(menuEntry.value.icon),
                  selectedIcon: Icon(
                    menuEntry.value.icon,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              )
              .toList(),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 0, 28, 0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Cadastro',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
