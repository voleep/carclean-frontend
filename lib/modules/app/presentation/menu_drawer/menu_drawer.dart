import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_session.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/menu_drawer/menu_drawer_divider.dart';
import 'package:voleep_carclean_frontend/routing/domain/enums/menu_group.dart';
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
          ref
              .read(menuControllerProvider.notifier)
              .onMenuSelected(selectedIndex: selectedIndex);
          Scaffold.of(context).closeEndDrawer();
        },
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 20, 16, 20),
            child: Text(
              'CarClean',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          ...ref
              .read(menuListProvider)
              .where((menu) => menu.group == MenuGroup.home)
              .toList()
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
          const MenuDrawerDivider("Cadastro"),
          ...ref
              .read(menuListProvider)
              .where((menu) => menu.group == MenuGroup.register)
              .toList()
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
          const MenuDrawerDivider("Configurações"),
          NavigationDrawerDestination(
            label: Row(children: [
              const Text("Empresa"),
              const SizedBox(width: 105),
              Icon(
                Icons.navigate_next_rounded,
                color: Theme.of(context).colorScheme.outline,
              )
            ]),
            icon: const Icon(Icons.business_rounded),
          ),
          NavigationDrawerDestination(
            label: GestureDetector(
              onTap: () => ref.read(oAuthSessionProvider.notifier).clear(),
              child: SizedBox(
                height: 55,
                child: Row(children: [
                  const Text("Encerrar sessão"),
                  const SizedBox(width: 55),
                  Icon(
                    Icons.navigate_next_rounded,
                    color: Theme.of(context).colorScheme.outline,
                  )
                ]),
              ),
            ),
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
    );
  }
}
