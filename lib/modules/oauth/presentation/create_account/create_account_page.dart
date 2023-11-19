import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voleep_carclean_frontend/core/constants/illustrations.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/create_account/widgets/create_account_form.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/create_account/widgets/account_form_wrapper.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AccountFormWrapper(
        child: Column(
      children: [
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: SvgPicture.asset(
            Illustrations.handshake,
            semanticsLabel: "Handshake illustration",
            height: 300,
            fit: BoxFit.fitHeight,
          ),
        ),
        const Spacer(),
        const CreateAccountForm()
      ],
    ));
  }
}
