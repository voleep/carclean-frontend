import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voleep_carclean_frontend/core/localization/app_locale.dart';
import 'package:voleep_carclean_frontend/core/states/providers/localization_provider.dart';
import 'package:voleep_carclean_frontend/core/states/providers/shared_preferences_provider.dart';
import 'carclean_app.dart';
import 'package:flutter_localization/flutter_localization.dart';

Future main() async {
  await dotenv.load(fileName: "environments/dev");
  final sharedPreferences = await SharedPreferences.getInstance();
  final localization = FlutterLocalization.instance;
  await localization.init(
    mapLocales: [
      const MapLocale('pt', AppLocale.PT),
    ],
    initLanguageCode: 'pt',
  );

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        localizationProvider.overrideWithValue(localization),
      ],
      child: const CarCleanApp(),
    ),
  );
}
