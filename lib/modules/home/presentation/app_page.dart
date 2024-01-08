import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/home/presentation/widgets/menu_drawer.dart';
import 'package:voleep_carclean_frontend/modules/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/loading/loading_screen.dart';

final drawerKey = GlobalKey<DrawerControllerState>();

class AppPage extends ConsumerWidget {
  const AppPage({Key? key, required this.navigationShell})
      : super(key: key ?? const ValueKey('AppPage'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    return Stack(
      clipBehavior: Clip.none,
      children: [
        LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  child: navigationShell,
                ),
              ),
              BottomNavBar(
                navigationShell: navigationShell,
              ),
            ],
          ),
        ),
        DrawerController(
          key: drawerKey,
          alignment: DrawerAlignment.start,
          child: MenuDrawer(
            navigationShell: navigationShell,
          ),
        ),
      ],
    );
  }
}