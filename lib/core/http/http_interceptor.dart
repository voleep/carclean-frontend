import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_session.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/repositories/providers/user_repository_provider.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/models/auth_model.dart';

part 'http_interceptor.g.dart';

@Riverpod(keepAlive: true)
HttpInterceptor httpInterceptor(HttpInterceptorRef ref) => HttpInterceptor(ref: ref);

class HttpInterceptor extends QueuedInterceptor {
  final Ref ref;

  HttpInterceptor({required this.ref});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final AuthModel? authModel = ref.read(oAuthSessionProvider).value;

    if (options.extra[HttpClient.dioAuthKey] == true && authModel != null) {
      options.headers.addAll({
        HttpHeaders.authorizationHeader: 'Bearer ${authModel.token}',
      });
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final DioException(:response, :requestOptions) = err;

    if (response?.statusCode == HttpStatus.unauthorized) {
      try {
        final AuthModel? authModel = ref.read(oAuthSessionProvider).value;

        if (authModel == null) {
          return handler.reject(err);
        }

        final AuthModel(:token, :refreshToken) = authModel;

        final userRepository = ref.read(userRepositoryProvider);

        final AuthModel newAuthModel = await userRepository.refreshToken(token: token, refreshToken: refreshToken);

        ref.read(oAuthSessionProvider.notifier).set(authModel: newAuthModel);

        requestOptions.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer ${newAuthModel.token}'});

        return handler.resolve(await _retry(requestOptions));
      } on DioException catch (dioError) {
        return handler.reject(dioError);
      } catch (error) {
        return handler.reject(DioException(requestOptions: requestOptions));
      }
    }

    return handler.next(err);
  }

  Future<Response> _retry(RequestOptions options) {
    final RequestOptions(:path, :method, :headers, :cancelToken, :onReceiveProgress, :queryParameters, :data) = options;

    return Dio().request(
      path,
      options: Options(
        method: method,
        headers: headers,
      ),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      data: data,
      queryParameters: queryParameters,
    );
  }
}
