import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'color_schemes.g.dart';
part 'app_bar_theme.dart';

final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat',
    appBarTheme: _lightAppBarTheme,
    colorScheme: _lightColorScheme);

final darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat',
    appBarTheme: _darkAppBarTheme,
    colorScheme: _darkColorScheme);
