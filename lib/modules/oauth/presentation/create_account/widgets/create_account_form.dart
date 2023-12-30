import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/create_account/viewmodels/create_account_form_vm.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/create_account/widgets/already_have_account.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/create_account/widgets/legal_agreement%20.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_button.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_form_field.dart';

class CreateAccountForm extends ConsumerStatefulWidget {
  const CreateAccountForm({super.key});

  @override
  ConsumerState<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends ConsumerState<CreateAccountForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameEC;
  late TextEditingController _emailEC;
  late TextEditingController _passwordEC;
  late TextEditingController _confirmPasswordEC;

  @override
  void initState() {
    super.initState();

    _usernameEC = TextEditingController();
    _emailEC = TextEditingController();
    _passwordEC = TextEditingController();
    _confirmPasswordEC = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(createAccountFormVmProvider, (_, value) {
      value.showSnackBarOnError(context);
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VoleepFormField(
                controller: _usernameEC,
                placeholder: "Usuário",
                icon: Icons.person_outline_rounded,
                validator: [
                  Validators.required(),
                  Validators.minLength(3),
                  Validators.maxLength(100),
                ].compose,
              ),
              VoleepFormField(
                controller: _emailEC,
                placeholder: "E-mail",
                icon: Icons.alternate_email_rounded,
                validator: [
                  Validators.required(),
                  Validators.maxLength(100),
                  Validators.email(),
                ].compose,
              ),
              VoleepFormField(
                controller: _passwordEC,
                placeholder: "Senha",
                icon: Icons.lock_outline_rounded,
                enableSuggestions: false,
                obscureText: true,
                validator: [
                  Validators.required(),
                  Validators.minLength(6),
                  Validators.maxLength(250),
                ].compose,
              ),
              VoleepFormField(
                  controller: _confirmPasswordEC,
                  placeholder: "Confirmar senha",
                  icon: Icons.lock_person_outlined,
                  enableSuggestions: false,
                  obscureText: true,
                  validator: [
                    Validators.required(),
                    Validators.compare(
                      _passwordEC,
                      "Senhas não conferem.",
                    ),
                  ].compose),
              const SizedBox(height: 10),
              const LegalAgreement(),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, ref, widget) {
                  final viewModel = ref.watch(createAccountFormVmProvider);

                  return viewModel.maybeWhen(
                    loading: () => VoleepButton.loading(),
                    orElse: () => VoleepButton(
                      child: const Text('CRIAR CONTA'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          ref.read(createAccountFormVmProvider.notifier).signUp(
                                nmUser: _usernameEC.text,
                                dsEmail: _emailEC.text,
                                dsPassword: _passwordEC.text,
                                confirmPassword: _confirmPasswordEC.text,
                              );
                        }
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              const AlreadyHaveAccount(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _usernameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();

    super.dispose();
  }
}
