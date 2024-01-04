import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/routing/go_router.dart';
import 'package:voleep_carclean_frontend/shared/theme/themes.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class CarCleanApp extends ConsumerWidget {
  const CarCleanApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.read(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: messengerKey,
      title: 'CarClean',
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: goRouter,
    );
  }
}
