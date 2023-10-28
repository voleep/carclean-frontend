import 'package:flutter/material.dart';

class VoleepExpansionPanel extends StatelessWidget {
  const VoleepExpansionPanel(
    this.title, {
    super.key,
    this.tilePadding = const EdgeInsets.symmetric(horizontal: 5),
    this.childrenPadding,
    this.backgroundColor,
    this.leading,
    this.initiallyExpanded = false,
    required this.children,
  });

  final String title;
  final EdgeInsetsGeometry? tilePadding;
  final EdgeInsetsGeometry? childrenPadding;
  final Color? backgroundColor;
  final Widget? leading;
  final bool initiallyExpanded;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          child: ExpansionTile(
            tilePadding: tilePadding,
            childrenPadding: childrenPadding,
            initiallyExpanded: initiallyExpanded,
            backgroundColor: backgroundColor,
            maintainState: true,
            title: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            shape: const RoundedRectangleBorder(side: BorderSide.none),
            collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
            leading: leading,
            children: children,
          ),
        ),
      ),
    );
  }
}
