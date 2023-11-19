import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/core/extensions/theme_extension.dart';

class VoleepButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? child;
  final void Function()? onPressed;
  final bool disabled;
  final bool isLoading;

  const VoleepButton({
    Key? key,
    this.backgroundColor,
    this.foregroundColor,
    this.child,
    this.onPressed,
    this.disabled = false,
    this.isLoading = false,
  }) : super(key: key);

  static VoleepButton loading() => const VoleepButton(isLoading: true);

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
        minimumSize: MaterialStateProperty.resolveWith(
            (states) => const Size.fromHeight(48)),
        backgroundColor: MaterialStateColor.resolveWith((states) {
          final Color backColor = backgroundColor != null
              ? backgroundColor!
              : Theme.of(context).colorScheme.surfaceTint;

          if (disabled) {
            return backColor.withOpacity(0.9);
          }

          return backColor;
        }),
        foregroundColor: MaterialStateColor.resolveWith((states) =>
            foregroundColor != null
                ? foregroundColor!
                : Theme.of(context).colorScheme.surface),
      ),
      onPressed: disabled || isLoading ? null : onPressed,
      child: isLoading
          ? SizedBox(
              height: 22,
              width: 22,
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                color: context.colorScheme.onPrimary,
              ),
            )
          : DefaultTextStyle(
              style: const TextStyle(fontSize: 15),
              child: child ?? const SizedBox.shrink(),
            ),
    );
  }
}
