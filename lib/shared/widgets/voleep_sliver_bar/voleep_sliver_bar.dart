import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/core/extensions/context_extension.dart';
import 'package:voleep_carclean_frontend/modules/home/presentation/app_page.dart';

class VoleepSliverBar extends StatelessWidget {
  const VoleepSliverBar({
    super.key,
    required this.title,
    this.actions,
  });

  final String title;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => SliverAppBar(
        floating: true,
        snap: true,
        titleSpacing: 0,
        backgroundColor: context.colorScheme.background,
        centerTitle: false,
        title: Text(title),
        actions: actions,
        leading: drawerKey.currentContext?.modalRoute?.isCurrent ?? false
            ? IconButton(
                icon: const Icon(Icons.menu_rounded, size: 27),
                onPressed: () => drawerKey.currentState?.open(),
              )
            : null,
      ),
    );
  }
}
