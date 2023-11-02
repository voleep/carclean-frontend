import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/create_account/providers/create_account_view_controller_provider.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_button.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_text_form_field.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: SvgPicture.asset(
            "assets/illustrations/create_account.svg",
            semanticsLabel: "Handshake illustration",
            height: 300,
            fit: BoxFit.fitHeight,
          ),
        ),
        const Spacer(),
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VoleepTextFormField(
                controller: usernameController,
                placeholder: "Usuário",
                icon: Icons.person_outline_rounded,
                validator: [Validators.required(), Validators.maxLength(100)].compose,
              ),
              VoleepTextFormField(
                controller: emailController,
                placeholder: "Email",
                icon: Icons.alternate_email_rounded,
                validator: [
                  Validators.required(),
                  Validators.maxLength(100),
                  Validators.email(),
                ].compose,
              ),
              VoleepTextFormField(
                controller: passwordController,
                placeholder: "Senha",
                icon: Icons.lock_outline_rounded,
                enableSuggestions: false,
                obscureText: true,
                validator: [
                  Validators.required(),
                  Validators.maxLength(250),
                ].compose,
              ),
              VoleepTextFormField(
                  controller: confirmPasswordController,
                  placeholder: "Confirmar senha",
                  icon: Icons.lock_person_outlined,
                  enableSuggestions: false,
                  obscureText: true,
                  validator: [
                    Validators.required(),
                    Validators.maxLength(250),
                    Validators.compare(passwordController, "Senhas não conferem."),
                  ].compose),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                        style: TextStyle(
                          height: 1.5,
                          color: Theme.of(context).colorScheme.outline,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: "Montserrat",
                        ),
                        text: "Ao criar uma conta, você concorda com os nossos "),
                    TextSpan(
                        style: TextStyle(
                          height: 1.5,
                          color: Theme.of(context).colorScheme.surfaceTint,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: "Montserrat",
                        ),
                        text: "Termos e Condições",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            var url = "https://www.voleep.com";
                            if (await canLaunchUrlString(url)) {
                              await launchUrlString(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          }),
                    TextSpan(
                        style: TextStyle(
                          height: 1.5,
                          color: Theme.of(context).colorScheme.outline,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: "Montserrat",
                        ),
                        text: " e "),
                    TextSpan(
                        style: TextStyle(
                          height: 1.5,
                          color: Theme.of(context).colorScheme.surfaceTint,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: "Montserrat",
                        ),
                        text: "Política de Privacidade",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            var url = "https://www.voleep.com";
                            if (await canLaunchUrlString(url)) {
                              await launchUrlString(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          }),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Consumer(
                  builder: (context, ref, widget) {
                    final controller = ref.watch(createAccountViewControllerProvider);

                    ref.listen<AsyncValue<void>>(
                        createAccountViewControllerProvider, (_, state) => state.showSnackBarOnError(context));

                    return VoleepButton(
                      disabled: controller.isLoading,
                      child: const Text(
                        'Continuar',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          ref.read(createAccountViewControllerProvider.notifier).signUp(
                                nmUser: usernameController.text,
                                dsEmail: emailController.text,
                                dsPassword: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                              );
                        }
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Já tem uma conta?",
                    style: TextStyle(
                        fontSize: 14, color: Theme.of(context).colorScheme.outline, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    child: Text(
                      " Entrar",
                      style: TextStyle(
                          fontSize: 14, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w600),
                    ),
                    onTap: () => context.pop(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
