import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'color_schemes.g.dart';
part 'app_bar_theme.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Montserrat',
  appBarTheme: _lightAppBarTheme,
  colorScheme: _lightColorScheme,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    },
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Montserrat',
  appBarTheme: _darkAppBarTheme,
  colorScheme: _darkColorScheme,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    },
  ),
);
