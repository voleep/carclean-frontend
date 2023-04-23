import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_state_provider.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/repositories/providers/user_repository_provider.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/models/auth_model.dart';

class HttpInterceptor extends QueuedInterceptor {
  final Ref ref;

  HttpInterceptor({required this.ref});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? contentType = options.headers[Headers.contentTypeHeader];

    final List<String> noJsonTypes = [
      'application/octet-stream',
      'multipart/form-data',
      Headers.formUrlEncodedContentType
    ];

    if (!noJsonTypes.contains(contentType)) {
      options.headers.addAll({
        HttpHeaders.contentTypeHeader: 'application/json',
      });
    }

    final authModel = ref.read(oAuthStateProvider);

    if (authModel.value != null) {
      options.headers.addAll({
        HttpHeaders.authorizationHeader: 'Bearer ${authModel.value!.token}'
      });
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final AuthModel? authModel = ref.read(oAuthStateProvider).value;

        if (authModel == null) {
          return handler.reject(err);
        }

        final AuthModel newAuthModel = await ref
            .read(userRepositoryProvider)
            .refreshToken(
                token: authModel.token, refreshToken: authModel.refreshToken);

        ref
            .read(oAuthStateProvider.notifier)
            .saveAuthInfo(authModel: newAuthModel);

        err.requestOptions.headers.addAll(
            {HttpHeaders.authorizationHeader: 'Bearer ${newAuthModel.token}'});

        return handler.resolve(await _retry(err.requestOptions));
      } on DioError catch (dioError) {
        return handler.reject(dioError);
      } catch (error) {
        return handler.reject(DioError(requestOptions: err.requestOptions));
      }
    }

    return handler.next(err);
  }

  Future<Response> _retry(RequestOptions requestOptions) {
    final opts =
        Options(method: requestOptions.method, headers: requestOptions.headers);

    return Dio().request(requestOptions.path,
        options: opts,
        cancelToken: requestOptions.cancelToken,
        onReceiveProgress: requestOptions.onReceiveProgress,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters);
  }
}
