import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LegalAgreement extends StatelessWidget {
  const LegalAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      height: 1.5,
      color: Theme.of(context).colorScheme.outline,
      fontSize: 12,
    );

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            style: textStyle,
            text: "Ao criar uma conta, você concorda com os nossos ",
          ),
          TextSpan(
            style: textStyle.copyWith(
              color: Theme.of(context).colorScheme.surfaceTint,
              fontWeight: FontWeight.w500,
            ),
            text: "Termos e Condições",
            recognizer: TapGestureRecognizer()
              ..onTap = () => launchUrlString("https://www.voleep.com"),
          ),
          TextSpan(
            style: textStyle,
            text: " e ",
          ),
          TextSpan(
            style: textStyle.copyWith(
              color: Theme.of(context).colorScheme.surfaceTint,
              fontWeight: FontWeight.w500,
            ),
            text: "Política de Privacidade",
            recognizer: TapGestureRecognizer()
              ..onTap = () => launchUrlString("https://www.voleep.com"),
          ),
        ],
      ),
    );
  }
}
