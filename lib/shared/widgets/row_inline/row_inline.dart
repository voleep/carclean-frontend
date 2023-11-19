import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/shared/widgets/wrap_super/wrap_super.dart';

class RowInline extends StatelessWidget {
  final List<Widget> children;
  final WrapFit wrapFit;

  const RowInline({
    super.key,
    this.wrapFit = WrapFit.proportional,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return WrapSuper(
      wrapFit: wrapFit,
      spacing: 8.0,
      lineSpacing: 5,
      children: children,
    );
  }
}
