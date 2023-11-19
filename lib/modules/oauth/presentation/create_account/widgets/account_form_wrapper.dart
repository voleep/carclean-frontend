import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/core/constants/images.dart';
import 'package:voleep_carclean_frontend/core/extensions/responsive_extension.dart';
import 'package:voleep_carclean_frontend/core/extensions/theme_extension.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scrollable_view/scrollable_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';

class AccountFormWrapper extends StatelessWidget {
  const AccountFormWrapper({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VoleepAppBar(
        title: Text("Criar conta"),
      ),
      body: Stack(
        children: [
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
                color: context.colorScheme.background,
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
    );
  }
}
