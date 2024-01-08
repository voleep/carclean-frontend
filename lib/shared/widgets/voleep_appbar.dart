import 'package:flutter/material.dart';

class VoleepAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget title;
  final Color backgroundColor;
  final Color shadowColor;
  final Color surfaceTintColor;
  final double elevation;
  final double titleSpacing;
  final bool showProgressBar;
  final List<Widget>? actions;

  const VoleepAppBar({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.transparent,
    this.shadowColor = Colors.transparent,
    this.surfaceTintColor = Colors.transparent,
    this.elevation = 0.0,
    this.titleSpacing = 0.0,
    this.actions,
    this.showProgressBar = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<VoleepAppBar> createState() => _VoleepAppBarState();
}

class _VoleepAppBarState extends State<VoleepAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.title,
      centerTitle: false,
      backgroundColor: widget.backgroundColor,
      shadowColor: widget.shadowColor,
      surfaceTintColor: widget.surfaceTintColor,
      elevation: widget.elevation,
      titleSpacing: widget.titleSpacing,
      actions: widget.actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Visibility(
          visible: widget.showProgressBar,
          replacement: const SizedBox(
            height: 2,
          ),
          child: LinearProgressIndicator(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary),
            minHeight: 2,
          ),
        ),
      ),
    );
  }
}
