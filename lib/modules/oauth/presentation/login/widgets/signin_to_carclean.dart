import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/core/constants/images.dart';
import 'package:voleep_carclean_frontend/core/extensions/context_extension.dart';

class SignInToCarclean extends StatelessWidget {
  const SignInToCarclean({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 29,
      fontWeight: FontWeight.w500,
    );

    return Column(
      children: [
        Image.asset(
          Images.carCleanLogo,
          height: 75,
        ),
        const SizedBox(height: 24),
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
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 56,
          ),
          child: Text(
            "Faça login no app para acessar suas ferramentas de controle de agendamentos, relatórios e muito mais. A eficiência do seu negócio começa aqui!",
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
