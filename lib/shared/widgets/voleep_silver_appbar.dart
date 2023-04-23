import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VoleepSliverAppBar extends StatelessWidget {
  final Widget title;
  final Color? backgroundColor;
  final Color shadowColor;
  final Color surfaceTintColor;
  final double elevation;
  final double titleSpacing;
  final SystemUiOverlayStyle systemOverlayStyle;
  final bool snap;
  final bool floating;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;

  const VoleepSliverAppBar({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.shadowColor = Colors.transparent,
    this.surfaceTintColor = Colors.transparent,
    this.elevation = 0.0,
    this.titleSpacing = 0.0,
    this.systemOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.white70,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    this.snap = false,
    this.floating = false,
    this.bottom,
    this.actions,
    this.automaticallyImplyLeading = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: title,
      snap: snap,
      floating: floating,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.background,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation,
      titleSpacing: titleSpacing,
      systemOverlayStyle: systemOverlayStyle,
      bottom: bottom,
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }
}
