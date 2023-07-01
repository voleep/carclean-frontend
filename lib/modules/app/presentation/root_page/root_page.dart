import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_state_provider.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/header_view/header_view.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/menu_drawer/menu_drawer.dart';
import 'package:voleep_carclean_frontend/routing/presentation/menus/providers/menu_controller_provider.dart';
import 'package:voleep_carclean_frontend/routing/presentation/menus/providers/menu_list_controller_provider.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';

class RootPage extends StatelessWidget {
  final Widget child;
  const RootPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      body: Row(
        children: [
          Visibility(
            visible: isTablet,
            child: Consumer(
              builder: (context, ref, child) {
                return SizedBox(
                  width: 80,
                  height: double.infinity,
                  child: NavigationRail(
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: IconButton(
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        icon: const Icon(Icons.menu_rounded),
                      ),
                    ),
                    selectedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
                    selectedIndex: ref.watch(menuControllerProvider),
                    onDestinationSelected: (index) => ref.read(menuControllerProvider.notifier).onMenuSelected(selectedIndex: index),
                    destinations: ref
                        .watch(menuListProvider)
                        .asMap()
                        .entries
                        .map(
                          (menuEntry) => NavigationRailDestination(
                            icon: Icon(menuEntry.value.icon),
                            label: Text(
                              menuEntry.value.label,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
          ),
          Visibility(
            visible: isDesktop,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(
                  right: BorderSide(width: 1, color: Theme.of(context).colorScheme.outlineVariant),
                ),
              ),
              child: const MenuDrawer(),
            ),
          ),
          Expanded(
            child: Responsive(
              mobile: child,
              desktop: Padding(padding: const EdgeInsets.all(12), child: child),
            ),
          )
        ],
      ),
      drawer: isTablet ? const MenuDrawer() : null,
      endDrawer: isMobile
          ? Consumer(builder: (context, ref, child) {
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
            })
          : null,
    );
  }
}
