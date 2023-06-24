import 'package:flutter/material.dart';

class ScrollableView extends StatelessWidget {
  const ScrollableView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        reverse: true,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
            minHeight: constraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: SafeArea(
              child: child,
            ),
          ),
        ),
      );
    });
  }
}
