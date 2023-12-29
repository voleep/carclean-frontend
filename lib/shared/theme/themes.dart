import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'color_schemes.g.dart';
part 'app_bar_theme.dart';

final lightTheme = ThemeData(
  fontFamily: 'RobotoSans',
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 16,
    ),
  ),
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
