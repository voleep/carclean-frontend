import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voleep_carclean_frontend/core/states/providers/shared_preferences_provider.dart';
import 'carclean_app.dart';

Future main() async {
  await dotenv.load(fileName: "environments/dev");
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const CarCleanApp(),
    ),
  );
}
