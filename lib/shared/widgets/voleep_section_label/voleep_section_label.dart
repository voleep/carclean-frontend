import 'package:flutter/material.dart';

class VoleepSectionLabel extends StatelessWidget {
  const VoleepSectionLabel(this.data, {super.key});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(bottom: 24, left: 5),
      child: Text(
        data,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
