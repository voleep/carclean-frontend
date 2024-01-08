import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'color_schemes.g.dart';
part 'app_bar_theme.dart';
part 'floating_action_button_theme.dart';

final lightTheme = ThemeData(
  fontFamily: 'RobotoSans',
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 16,
    ),
  ),
  floatingActionButtonTheme: _lightFloatingActionButtonTheme,
  appBarTheme: _lightAppBarTheme,
  colorScheme: _lightColorScheme,
  pageTransitionsTheme: pageTransitionsTheme,
);

final darkTheme = ThemeData(
  fontFamily: 'RobotoSans',
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 16,
    ),
  ),
  floatingActionButtonTheme: _darkFloatingActionButtonTheme,
  appBarTheme: _darkAppBarTheme,
  colorScheme: _darkColorScheme,
  pageTransitionsTheme: pageTransitionsTheme,
);

const pageTransitionsTheme = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
  },
);
