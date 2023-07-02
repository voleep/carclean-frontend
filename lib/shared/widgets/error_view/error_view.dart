import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_button.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.error, required this.onTryAgain, this.stackTrace});

  final void Function()? onTryAgain;
  final Object error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    final bodyTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w500,
      fontSize: 15,
      fontFamily: "Montserrat",
    );

    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/illustrations/error_page.svg",
            semanticsLabel: "Astronalt",
            height: 220,
            fit: BoxFit.fitWidth,
          ),
          const Text(
            "Oops... Algo saiu mal",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
          ),
          const SizedBox(
            height: 14,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(style: bodyTextStyle, text: "Por favor, tente novamente ou contate "),
                TextSpan(
                  style: bodyTextStyle.copyWith(color: Theme.of(context).colorScheme.surfaceTint),
                  text: "suporte@voleep.com ",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'suporte@carclean.voleep.com',
                        queryParameters: {
                          'subject': 'Problemas com Erro no App',
                          'body': '\n\n\nDetalhes do erro: $error\n\nStackTrace: $stackTrace'
                        },
                      );
                      if (await canLaunchUrl(emailLaunchUri)) {
                        await launchUrl(emailLaunchUri);
                      } else {
                        throw 'Não foi possível abrir o seu email';
                      }
                    },
                ),
                TextSpan(style: bodyTextStyle, text: "para receber suporte"),
              ],
            ),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Erro"),
                    content: Text(
                      "$error",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => context.pop(),
                        child: const Text("FECHAR"),
                      )
                    ],
                  );
                },
              );
            },
            child: const Text(
              "Ver detalhes do erro",
              style: TextStyle(fontSize: 13),
            ),
          ),
          VoleepButton(
            onPressed: onTryAgain,
            child: const Text(
              'Tentar novamente',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
