import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/states/providers/localization_provider.dart';
import 'package:voleep_carclean_frontend/routing/routes/go_router_provider.dart';
import 'package:voleep_carclean_frontend/shared/theme/themes.dart';

class CarCleanApp extends ConsumerWidget {
  const CarCleanApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.read(goRouterProvider);
    final localization = ref.read(localizationProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'CarClean',
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: goRouter,
      localizationsDelegates: localization.localizationsDelegates,
      supportedLocales: localization.supportedLocales,
    );
  }
}
