import 'package:flutter/material.dart';

class VoleepExpansionPanel extends StatelessWidget {
  const VoleepExpansionPanel(
    this.title, {
    super.key,
    this.tilePadding = const EdgeInsets.symmetric(horizontal: 5),
    this.childrenPadding,
    required this.children,
  });

  final String title;
  final EdgeInsetsGeometry? tilePadding;
  final EdgeInsetsGeometry? childrenPadding;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ExpansionTile(
        tilePadding: tilePadding,
        childrenPadding: childrenPadding,
        initiallyExpanded: true,
        title: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide.none,
        ),
        collapsedShape: const RoundedRectangleBorder(
          side: BorderSide.none,
        ),
        children: children,
      ),
    );
  }
}
