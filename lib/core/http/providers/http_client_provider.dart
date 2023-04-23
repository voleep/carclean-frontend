import 'package:hooks_riverpod/hooks_riverpod.dart' show Provider;
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/core/http/providers/http_interceptor_provider.dart';
import 'package:voleep_carclean_frontend/core/http/providers/dio_provider.dart';

final httpClientProvider = Provider<HttpClient>((ref) {
  final dio = ref.watch(dioProvider);

  final httpInterceptor = ref.watch(httpInterceptorProvider);

  dio.interceptors.clear();
  dio.interceptors.add(httpInterceptor);

  return HttpClient(dio: dio);
});
