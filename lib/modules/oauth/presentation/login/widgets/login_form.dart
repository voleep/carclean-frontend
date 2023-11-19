import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/login/providers/login_view_controller_provider.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/login/widgets/new_account.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_button.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AutofillGroup(
            child: Column(
              children: [
                VoleepTextFormField(
                  autofillHints: const [AutofillHints.email],
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  placeholder: "Email",
                  icon: Icons.alternate_email_rounded,
                  validator: [
                    Validators.required(),
                    Validators.email(),
                  ].compose,
                ),
                VoleepTextFormField(
                  autofillHints: const [AutofillHints.password],
                  controller: _passwordController,
                  placeholder: "Senha",
                  icon: Icons.lock_outline_rounded,
                  enableSuggestions: false,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: Validators.required(),
                ),
              ],
            ),
          ),
          TextButton(
            child: const Text("Esqueci a senha?"),
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              context.go("/login/forget-password");
            },
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Consumer(
              builder: (context, ref, widget) {
                final controller = ref.watch(loginViewControllerProvider);

                ref.listen<AsyncValue<void>>(loginViewControllerProvider,
                    (_, state) => state.showSnackBarOnError(context));

                return VoleepButton(
                  disabled: controller.isLoading,
                  child: const Text('ENTRAR'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      await ref
                          .read(loginViewControllerProvider.notifier)
                          .doLogin(
                              _emailController.text, _passwordController.text);
                      if (!ref.read(loginViewControllerProvider).hasError) {
                        TextInput.finishAutofillContext();
                      }
                    }
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const NewAccount()
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
