import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.message,
    required this.onTap,
  });

  final String message;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(message),
        FilledButton(
          onPressed: onTap,
          child: const Text("TENTAR NOVAMENTE"),
        ),
      ],
    );
  }
}
