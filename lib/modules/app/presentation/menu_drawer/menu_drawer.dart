import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/routing/presentation/menus/providers/menu_controller_provider.dart';
import 'package:voleep_carclean_frontend/routing/presentation/menus/providers/menu_list_controller_provider.dart';

class MenuDrawer extends ConsumerWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 260,
      child: NavigationDrawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        selectedIndex: ref.watch(menuControllerProvider),
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
              .watch(menuListProvider)
              .asMap()
              .entries
              .map(
                (menuEntry) => NavigationDrawerDestination(
                  label: Text(menuEntry.value.label),
                  icon: Hero(
                    tag: 'menu${menuEntry.key}',
                    child: Icon(menuEntry.value.icon),
                  ),
                  selectedIcon: Hero(
                    tag: 'menu${menuEntry.key}',
                    child: Icon(
                      menuEntry.value.icon,
                      color: Theme.of(context).colorScheme.primary,
                    ),
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
