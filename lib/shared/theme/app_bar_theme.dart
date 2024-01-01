part of 'themes.dart';

final _lightAppBarTheme = AppBarTheme(
  surfaceTintColor: _lightColorScheme.background,
  backgroundColor: _lightColorScheme.background.withOpacity(0.9),
  elevation: 0,
  titleTextStyle: TextStyle(
    fontFamily: 'RobotoSans',
    fontSize: 20,
    color: _lightColorScheme.primary,
    fontWeight: FontWeight.w500,
  ),
);

final _darkAppBarTheme = AppBarTheme(
  surfaceTintColor: _darkColorScheme.background,
  backgroundColor: _darkColorScheme.background.withOpacity(0.9),
  elevation: 0,
  titleTextStyle: TextStyle(
    fontFamily: 'RobotoSans',
    fontSize: 20,
    color: _darkColorScheme.primary,
    fontWeight: FontWeight.w500,
  ),
);
