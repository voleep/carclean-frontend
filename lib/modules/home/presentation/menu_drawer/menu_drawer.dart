import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/core/extensions/go_router_extension.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_session.dart';
import 'package:voleep_carclean_frontend/core/routing/go_router.dart';
import 'package:voleep_carclean_frontend/core/routing/menu/menu_group.dart';
import 'package:voleep_carclean_frontend/core/routing/menu/menu_list_extension.dart';
import 'package:voleep_carclean_frontend/core/routing/user_menus.dart';
import 'package:voleep_carclean_frontend/modules/home/presentation/app_page/app_page.dart';
import 'package:voleep_carclean_frontend/modules/home/presentation/menu_drawer/menu_drawer_divider.dart';

class MenuDrawer extends ConsumerWidget {
  const MenuDrawer({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final curPath = ref.read(goRouterProvider).currentPath;
    final menus = ref.watch(userMenusProvider);

    return SizedBox(
      width: 280,
      child: NavigationDrawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        selectedIndex: menus.indexOfPath(curPath),
        onDestinationSelected: (index) {
          final menu = menus[index];
          context.go(menu.path);
          drawerKey.currentState?.close();
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
          ...menus
              .where((menu) => menu.group == MenuGroup.home)
              .toList()
              .asMap()
              .entries
              .map(
                (menuEntry) => NavigationDrawerDestination(
                  label: Text(menuEntry.value.title),
                  icon: Icon(menuEntry.value.icon),
                  selectedIcon: Icon(
                    menuEntry.value.icon,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              )
              .toList(),
          const MenuDrawerDivider("Cadastro"),
          ...menus
              .where((menu) => menu.group == MenuGroup.registeration)
              .toList()
              .asMap()
              .entries
              .map(
                (menuEntry) => NavigationDrawerDestination(
                  label: Text(menuEntry.value.title),
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
