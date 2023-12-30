import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/login/viewmodels/login_form_vm.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/login/widgets/new_account.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_button.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_form_field.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailEC;
  late TextEditingController _passwordEC;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailEC = TextEditingController();
    _passwordEC = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(loginFormVMProvider, (_, state) {
      state.showSnackBarOnError(context);

      if (state.hasValue) {
        TextInput.finishAutofillContext();
      }
    });

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AutofillGroup(
            child: Column(
              children: [
                VoleepFormField(
                  autofillHints: const [AutofillHints.email],
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailEC,
                  placeholder: "Email",
                  icon: Icons.alternate_email_rounded,
                  validator: [
                    Validators.required(),
                    Validators.email(),
                  ].compose,
                ),
                const SizedBox(height: 10),
                VoleepFormField(
                  autofillHints: const [AutofillHints.password],
                  controller: _passwordEC,
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
          SizedBox(
            height: 35,
            child: TextButton(
              child: const Text("Esqueceu a senha?"),
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                context.go("/login/forget-password");
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Consumer(
              builder: (context, ref, widget) {
                final viewModel = ref.watch(loginFormVMProvider);

                return viewModel.maybeWhen(
                  loading: () => VoleepButton.loading(),
                  orElse: () => VoleepButton(
                    child: const Text('ENTRAR'),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        ref
                            .read(loginFormVMProvider.notifier)
                            .signIn(_emailEC.text, _passwordEC.text);
                      }
                    },
                  ),
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
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }
}
