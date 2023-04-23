import 'package:flutter/material.dart';

class VoleepDividerText extends StatelessWidget {
  final Text title;

  const VoleepDividerText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            endIndent: 12,
          ),
        ),
        title,
        const Expanded(
          child: Divider(
            indent: 12,
          ),
        )
      ],
    );
  }
}
