import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Theme.of(context).colorScheme.outlineVariant))),
    );
  }
}
