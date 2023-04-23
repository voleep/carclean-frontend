import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/routing/presentation/menus/providers/menu_list_controller_provider.dart';
import 'package:voleep_carclean_frontend/routing/presentation/menus/providers/menu_controller_provider.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';

class AppPage extends StatefulWidget {
  final Widget child;

  const AppPage({Key? key, required this.child}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      body: widget.child,
      bottomNavigationBar: Visibility(
        visible: !Responsive.isDesktop(context),
        child: Consumer(builder: (context, ref, child) {
          int selectedIndex = ref.watch(menuControllerProvider);
          int menuLenght = Responsive.isTablet(context) ? 6 : 4;

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
                  (menu) =>
                      NavigationDestination(icon: menu.icon, label: menu.label),
                )
                .toList(),
            onDestinationSelected: (index) => {
              if (index != selectedIndex)
                {
                  ref
                      .read(menuControllerProvider.notifier)
                      .onMenuSelected(selectedIndex: index)
                }
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push("/app/customer"),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
