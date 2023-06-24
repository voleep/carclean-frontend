import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeleteBottomSheet extends StatelessWidget {
  const DeleteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    const buttonStyle = ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        TextStyle(fontSize: 17),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 28, right: 12, bottom: 12, left: 12),
      child: Flex(mainAxisSize: MainAxisSize.min, direction: Axis.vertical, children: [
        Text(
          "Deseja realmente excluir este registro?",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              style: buttonStyle.copyWith(
                foregroundColor: const MaterialStatePropertyAll(Colors.redAccent),
              ),
              onPressed: () => context.pop(true),
              child: const Text("SIM"),
            ),
            TextButton(
              style: buttonStyle,
              onPressed: () => context.pop(false),
              child: const Text("NÃO"),
            ),
          ],
        )
      ]),
    );
  }
}
