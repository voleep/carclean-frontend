part of 'themes.dart';

final _lightAppBarTheme = AppBarTheme(
  elevation: 0,
  systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
  ),
  surfaceTintColor: _lightColorScheme.background,
  shadowColor: _lightColorScheme.shadow,
  titleTextStyle: TextStyle(
    fontFamily: 'RobotoSans',
    fontSize: 23,
    color: _lightColorScheme.primary,
    fontWeight: FontWeight.w500,
  ),
);

final _darkAppBarTheme = AppBarTheme(
  elevation: 0,
  systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ),
  surfaceTintColor: _darkColorScheme.background,
  shadowColor: _darkColorScheme.shadow,
  titleTextStyle: TextStyle(
    fontFamily: 'RobotoSans',
    fontSize: 23,
    color: _darkColorScheme.primary,
    fontWeight: FontWeight.w500,
  ),
);
