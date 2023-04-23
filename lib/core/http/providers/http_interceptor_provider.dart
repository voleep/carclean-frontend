import 'package:hooks_riverpod/hooks_riverpod.dart' show Provider;
import 'package:voleep_carclean_frontend/core/http/http_interceptor.dart';

final httpInterceptorProvider =
    Provider<HttpInterceptor>((ref) => HttpInterceptor(ref: ref));
