import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CanDeactivateDialog extends StatelessWidget {
  const CanDeactivateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Deseja mesmo sair?"),
      content: const Text(
          "É possível que algumas alterações ainda não tenham sido efetuadas."),
      actions: [
        TextButton(
          onPressed: () {
            context.pop(false);
          },
          child: const Text("CANCELAR"),
        ),
        TextButton(
          onPressed: () {
            context.pop(true);
          },
          child: const Text("SAIR"),
        )
      ],
      actionsPadding: const EdgeInsets.only(right: 24, bottom: 15),
    );
  }
}
