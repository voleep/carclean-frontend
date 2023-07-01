import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/routing/menus/menu_controller.dart';
import 'package:voleep_carclean_frontend/routing/menus/menu_list.dart';
import 'package:voleep_carclean_frontend/routing/menus/selected_menu_index.dart';
import 'package:voleep_carclean_frontend/routing/routes/go_router_provider.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';
import 'package:voleep_carclean_frontend/shared/widgets/loading/loading_screen.dart';

class AppPage extends StatefulWidget {
  final Widget child;

  const AppPage({Key? key, required this.child}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        extendBodyBehindAppBar: true,
        body: widget.child,
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
                    (menu) => NavigationDestination(icon: Icon(menu.icon), label: menu.label),
                  )
                  .toList(),
              onDestinationSelected: (index) => {
                if (index != selectedIndex) {ref.read(menuControllerProvider.notifier).onMenuSelected(selectedIndex: index)}
              },
            );
          }),
        ),
        floatingActionButton: Consumer(
          builder: (context, ref, child) {
            final menuList = ref.watch(menuListProvider);

            final selectedIndex = ref.watch(selectedMenuIndexProvider);

            final selectedMenu = menuList[selectedIndex];

            if (selectedMenu.fabOptions != null && selectedMenu.location == ref.read(goRouterProvider).location) {
              return FloatingActionButton(
                onPressed: () => selectedMenu.fabOptions!.onPressed(ref),
                child: Icon(selectedMenu.fabOptions!.icon),
              );
            }

            return const SizedBox.shrink();
          },
        ));
  }
}
