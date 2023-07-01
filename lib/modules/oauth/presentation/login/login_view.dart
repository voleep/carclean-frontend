import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/login/providers/login_view_controller_provider.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_button.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_text_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: SvgPicture.asset("assets/illustrations/login.svg", semanticsLabel: "Startup", height: 300, fit: BoxFit.fitHeight),
        ),
        const Spacer(),
        const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
        ),
        const SizedBox(
          height: 30,
        ),
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutofillGroup(
                child: Column(
                  children: [
                    VoleepTextFormField(
                      autofillHints: const [AutofillHints.email],
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      placeholder: "Email",
                      icon: Icons.alternate_email_rounded,
                      validator: (value) => Validators.listOf([() => Validators.required(value), () => Validators.email(value)]),
                    ),
                    VoleepTextFormField(
                      autofillHints: const [AutofillHints.password],
                      controller: passwordController,
                      placeholder: "Senha",
                      icon: Icons.lock_outline_rounded,
                      enableSuggestions: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: Validators.required,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Text(
                    "Esqueci a senha?",
                    style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    context.go("/login/forget-password");
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Consumer(
                  builder: (context, ref, widget) {
                    final controller = ref.watch(loginViewControllerProvider);

                    ref.listen<AsyncValue<void>>(loginViewControllerProvider, (_, state) => state.showSnackBarOnError(context));

                    return VoleepButton(
                      disabled: controller.isLoading,
                      child: const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          await ref.read(loginViewControllerProvider.notifier).doLogin(emailController.text, passwordController.text);
                          if (!ref.read(loginViewControllerProvider).hasError) {
                            TextInput.finishAutofillContext();
                          }
                        }
                      },
                    );
                  },
                ),
              ),
            ],
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
              "Ainda não tem uma conta?",
              style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.outline, fontWeight: FontWeight.w500),
            ),
            GestureDetector(
                child: Text(
                  " Criar conta",
                  style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  context.go("/login/create-account");
                }),
          ],
        ),
      ],
    );
  }
}
