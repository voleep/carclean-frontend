import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/app_routes.dart';

class NewAccount extends StatelessWidget {
  const NewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Ainda não tem uma conta? ",
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        GestureDetector(
            child: Text(
              "Criar conta",
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              context.push(AppRoutes.register);
            }),
      ],
    );
  }
}
