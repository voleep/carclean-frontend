import 'package:flutter/material.dart';

class VoleepButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget child;
  final void Function()? onPressed;
  final bool disabled;

  const VoleepButton({
    Key? key,
    this.backgroundColor,
    this.foregroundColor,
    required this.child,
    required this.onPressed,
    this.disabled = false,
  }) : super(key: key);

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

          if (disabled == true) {
            return backColor.withOpacity(0.9);
          }

          return backColor;
        }),
        foregroundColor: MaterialStateColor.resolveWith((states) =>
            foregroundColor != null
                ? foregroundColor!
                : Theme.of(context).colorScheme.surface),
      ),
      onPressed: disabled == true ? null : onPressed,
      child:
          DefaultTextStyle(style: const TextStyle(fontSize: 15), child: child),
    );
  }
}
