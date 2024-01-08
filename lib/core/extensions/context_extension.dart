import 'package:flutter/material.dart'
    show BuildContext, ColorScheme, Theme, ModalRoute;

extension ContextExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  ModalRoute? get modalRoute => ModalRoute.of(this);
}
