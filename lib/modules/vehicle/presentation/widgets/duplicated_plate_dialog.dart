import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DuplicatedPlateDialog extends StatelessWidget {
  const DuplicatedPlateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Placa duplicada"),
      content: const Text(
          "Já existe um veículo cadastrado com a mesma placa. Deseja continuar mesmo assim?"),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: const Text("CANCELAR"),
        ),
        TextButton(
          onPressed: () => context.pop(true),
          child: const Text("CONTINUAR"),
        ),
      ],
    );
  }
}
