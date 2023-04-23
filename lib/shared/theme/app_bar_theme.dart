part of 'themes.dart';

final _lightAppBarTheme = AppBarTheme(
  surfaceTintColor: _lightColorScheme.background,
  backgroundColor: _lightColorScheme.background.withOpacity(0.9),
  elevation: 0,
  titleTextStyle: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 20,
      color: _lightColorScheme.primary,
      fontWeight: FontWeight.w600),
  systemOverlayStyle: const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ),
);

final _darkAppBarTheme = AppBarTheme(
  surfaceTintColor: _darkColorScheme.background,
  backgroundColor: _darkColorScheme.background.withOpacity(0.9),
  elevation: 0,
  titleTextStyle: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 20,
      color: _darkColorScheme.primary,
      fontWeight: FontWeight.w600),
  systemOverlayStyle: const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ),
);