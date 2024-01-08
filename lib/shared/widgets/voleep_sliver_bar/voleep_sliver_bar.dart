import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/modules/home/presentation/app_page/app_page.dart';

class VoleepSliverBar extends StatefulWidget {
  const VoleepSliverBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<VoleepSliverBar> createState() => _VoleepSliverBarState();
}

class _VoleepSliverBarState extends State<VoleepSliverBar> {
  @override
  Widget build(BuildContext context) {
    final showMenu =
        ModalRoute.of(drawerKey.currentContext!)?.isCurrent ?? false;
    return SliverAppBar(
      floating: true,
      snap: true,
      titleSpacing: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
      centerTitle: false,
      title: Text(widget.title),
      leading: showMenu
          ? IconButton(
              icon: const Icon(Icons.menu_rounded, size: 27),
              onPressed: () => drawerKey.currentState?.open(),
            )
          : null,
    );
  }
}
