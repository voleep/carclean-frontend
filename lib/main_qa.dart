import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/carclean_app.dart';

Future main() async {
  await dotenv.load(fileName: "environments/.qa");
  runApp(
    const ProviderScope(
      child: CarCleanApp(),
    ),
  );
}
