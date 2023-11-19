import 'package:flutter/material.dart';

class ScrollableView extends StatelessWidget {
  const ScrollableView({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraint.maxHeight,
          ),
          child: child,
        ),
      );
    });
  }
}
