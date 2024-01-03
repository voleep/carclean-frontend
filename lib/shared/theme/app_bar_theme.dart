part of 'themes.dart';

final _lightAppBarTheme = AppBarTheme(
  elevation: 0,
  systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
  ),
  titleTextStyle: TextStyle(
    fontFamily: 'RobotoSans',
    fontSize: 20,
    color: _lightColorScheme.primary,
    fontWeight: FontWeight.w500,
  ),
);

final _darkAppBarTheme = AppBarTheme(
  elevation: 0,
  systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ),
  titleTextStyle: TextStyle(
    fontFamily: 'RobotoSans',
    fontSize: 20,
    color: _darkColorScheme.primary,
    fontWeight: FontWeight.w500,
  ),
);
