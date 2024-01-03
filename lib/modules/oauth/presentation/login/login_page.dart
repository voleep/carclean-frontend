import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/login/widgets/login_form.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/login/widgets/login_form_wrapper.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/login/widgets/signin_to_carclean.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage('assets/images/gradient.png'), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const LoginFormWrapper(
      child: Column(
        children: [
          Spacer(flex: 2),
          SignInToCarclean(),
          Spacer(),
          LoginForm(),
        ],
      ),
    );
  }
}
