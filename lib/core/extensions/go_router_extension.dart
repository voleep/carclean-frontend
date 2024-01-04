import 'package:go_router/go_router.dart';

extension GoRouteExtension on GoRouter {
  String get currentPath => routerDelegate.currentConfiguration.uri.toString();
}

extension GoRouterStateExtension on GoRouterState {
  String? ifMathFullOrNull(String value) {
    return matchedLocation == fullPath ? value : null;
  }
}
