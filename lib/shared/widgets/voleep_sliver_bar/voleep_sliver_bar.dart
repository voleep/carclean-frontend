import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/core/extensions/context_extension.dart';
import 'package:voleep_carclean_frontend/modules/home/presentation/app_page.dart';

class VoleepSliverBar extends StatelessWidget {
  const VoleepSliverBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      titleSpacing: 0,
      backgroundColor: context.colorScheme.background,
      centerTitle: false,
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle),
        ),
      ],
      leading: drawerKey.currentContext?.modalRoute?.isCurrent ?? false
          ? IconButton(
              icon: const Icon(Icons.menu_rounded, size: 27),
              onPressed: () => drawerKey.currentState?.open(),
            )
          : null,
    );
  }
}
