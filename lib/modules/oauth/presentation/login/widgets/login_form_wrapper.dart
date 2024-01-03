import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voleep_carclean_frontend/core/constants/images.dart';
import 'package:voleep_carclean_frontend/core/extensions/responsive_extension.dart';

import 'package:voleep_carclean_frontend/shared/widgets/scrollable_view/scrollable_view.dart';

class LoginFormWrapper extends StatelessWidget {
  const LoginFormWrapper({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Theme.of(context).appBarTheme.systemOverlayStyle ??
          const SystemUiOverlayStyle(),
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "assets/images/gradient.png",
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Offstage(
              offstage: context.smallScreen,
              child: Image.asset(
                Images.waterService,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: context.smallScreen ? double.infinity : 700,
                  maxWidth: 450,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.hardEdge,
                child: ScrollableView(
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: child,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
