import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_button.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_form_field.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          reverse: true,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: SafeArea(
                  child: Container(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        "assets/illustrations/forget_password.svg",
                        semanticsLabel: "Question illustration",
                        height: 235,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "Esqueceu sua senha?",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 35,
                          height: 1.3),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Relaxa! Isso acontece. Por favor, digite o endereço de e-mail associado à sua conta.",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    const Spacer(),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VoleepFormField(
                            placeholder: "Email",
                            icon: Icons.alternate_email_rounded,
                            validator: [
                              Validators.required(),
                              Validators.email(),
                            ].compose,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: VoleepButton(
                              child: const Text(
                                'Recuperar',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ),
        );
      }),
    );
  }
}
