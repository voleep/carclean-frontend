import 'package:flutter/material.dart' show BuildContext, ColorScheme, Theme;

extension ThemeExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
