import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_session.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/repositories/user_repository.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/models/auth_model.dart';

part 'http_interceptor.g.dart';

@Riverpod(keepAlive: true)
HttpInterceptor httpInterceptor(HttpInterceptorRef ref) =>
    HttpInterceptor(ref: ref);

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
      final AuthModel? authModel = ref.read(oAuthSessionProvider).value;

      if (authModel == null) {
        return handler.reject(err);
      }

      final AuthModel(:token, :refreshToken) = authModel;

      final refreshResponse =
          await ref.read(userRepositoryProvider).refreshToken(
                token: token,
                refreshToken: refreshToken,
              );

      switch (refreshResponse) {
        case Success(:final value):
          {
            ref.read(oAuthSessionProvider.notifier).set(authModel: value);
            requestOptions.headers.addAll({
              HttpHeaders.authorizationHeader: 'Bearer ${value.token}',
            });
            return handler.resolve(await _retry(requestOptions));
          }
        case Failure():
          return handler.reject(err);
      }
    }

    return handler.next(err);
  }

  Future<Response> _retry(RequestOptions options) {
    final RequestOptions(
      :path,
      :method,
      :headers,
      :cancelToken,
      :onReceiveProgress,
      :queryParameters,
      :data
    ) = options;

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
