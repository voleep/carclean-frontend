import 'package:flutter/material.dart';

class ScrollableView extends StatelessWidget {
  const ScrollableView(
      {super.key,
      this.padding = const EdgeInsets.only(top: 24, left: 12, right: 12),
      this.constraints = const BoxConstraints(maxWidth: 1280),
      this.alignment = Alignment.topCenter,
      required this.child});

  final Widget child;
  final EdgeInsets padding;
  final BoxConstraints constraints;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 60),
      child: Center(
        child: Container(
          alignment: alignment,
          padding: padding,
          constraints: constraints,
          child: child,
        ),
      ),
    );
  }
}
