import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

class RowInline extends StatelessWidget {
  const RowInline(
      {super.key, this.wrapFit = WrapFit.proportional, required this.children});

  final List<Widget> children;
  final WrapFit wrapFit;

  @override
  Widget build(BuildContext context) {
    return WrapSuper(
      wrapFit: wrapFit,
      spacing: 8.0,
      children: children,
    );
  }
}
