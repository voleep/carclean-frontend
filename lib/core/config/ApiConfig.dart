import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiConfig {
  static String OAUTH_API_URL = dotenv.env['OAUTH_API_URL']!;
  static String CARCLEAN_API_URL = dotenv.env['CARCLEAN_API_URL']!;
}