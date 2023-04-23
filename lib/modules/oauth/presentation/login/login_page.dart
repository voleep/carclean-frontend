import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/login/login_view.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/login/welcome_view.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              leading: Icon(
                Icons.local_car_wash_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              titleSpacing: -5,
              title: const Text("CarClean"),
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: Responsive.isDesktop(context),
                      child: const Flexible(
                        child: WelcomeView(),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                            top: Responsive.isDesktop(context) ? 100 : 0,
                            bottom: Responsive.isDesktop(context) ? 100 : 24),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 400,
                          ),
                          child: const LoginView(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
