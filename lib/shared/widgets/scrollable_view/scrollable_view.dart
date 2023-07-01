import 'package:flutter/material.dart';

class ScrollableView extends StatelessWidget {
  const ScrollableView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 60),
      child: child,
    );
  }
}
