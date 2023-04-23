import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_state_provider.dart';
import 'package:voleep_carclean_frontend/routing/presentation/menus/providers/menu_controller_provider.dart';
import 'package:voleep_carclean_frontend/routing/presentation/menus/providers/menu_list_controller_provider.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';

class RootPage extends StatelessWidget {
  final Widget child;
  const RootPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Visibility(
            visible: Responsive.isDesktop(context),
            child: SizedBox(
              width: 220,
              child: Consumer(
                builder: (context, ref, child) {
                  return NavigationRail(
                      unselectedLabelTextStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      selectedLabelTextStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                      ),
                      selectedIconTheme: IconThemeData(
                          color: Theme.of(context).colorScheme.primary),
                      leading: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        child: Text(
                          'CarClean',
                          style: Theme.of(context).appBarTheme.titleTextStyle,
                        ),
                      ),
                      extended: true,
                      selectedIndex: ref.watch(menuControllerProvider),
                      onDestinationSelected: (index) => ref
                          .read(menuControllerProvider.notifier)
                          .onMenuSelected(selectedIndex: index),
                      destinations: ref
                          .watch(menuListProvider)
                          .map(
                            (menu) => NavigationRailDestination(
                              icon: menu.icon,
                              label: Text(
                                menu.label,
                              ),
                            ),
                          )
                          .toList());
                },
              ),
            ),
          ),
          const VerticalDivider(
            width: 1,
          ),
          Flexible(
            flex: 5,
            child: child,
          ),
        ],
      ),
      endDrawer: Visibility(
        visible: !Responsive.isDesktop(context),
        child: Consumer(builder: (context, ref, child) {
          return Stack(alignment: AlignmentDirectional.bottomCenter, children: [
            NavigationDrawer(
              selectedIndex: ref.watch(menuControllerProvider),
              onDestinationSelected: (selectedIndex) {
                ref
                    .read(menuControllerProvider.notifier)
                    .onMenuSelected(selectedIndex: selectedIndex);
                Scaffold.of(context).closeEndDrawer();
              },
              children: ref
                  .watch(menuListProvider)
                  .map((menu) => NavigationDrawerDestination(
                        label: Text(menu.label),
                        icon: menu.icon,
                      ))
                  .toList(),
            ),
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
      ),
    );
  }
}
