import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/core/constants/images.dart';
import 'package:voleep_carclean_frontend/core/extensions/theme_extension.dart';

class SignInToCarclean extends StatelessWidget {
  const SignInToCarclean({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
    );

    return Column(
      children: [
        const SizedBox(height: 12),
        Image.asset(
          Images.carCleanLogo,
          height: 65,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Entrar no ",
              style: textStyle,
            ),
            Text(
              "CarClean",
              style: textStyle.copyWith(
                color: context.colorScheme.primary,
              ),
            )
          ],
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 50,
          ),
          child: Text(
            "Bem vindo(a) ao CarClean! Faça login para acessar suas ferramentas de controle de agendamentos, relatórios e muito mais. Sua eficiência começa aqui!",
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.3,
              color: context.colorScheme.onBackground.withOpacity(0.8),
            ),
          ),
        )
      ],
    );
  }
}
