import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/login/widgets/login_form.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/login/widgets/login_form_wrapper.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/login/widgets/signin_to_carclean.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginFormWrapper(
      child: Column(
        children: [
          Spacer(),
          SignInToCarclean(),
          Spacer(),
          LoginForm(),
        ],
      ),
    );
  }
}
