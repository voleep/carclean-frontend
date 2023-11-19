import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/constants/error_messages.dart';
import 'package:voleep_carclean_frontend/core/exceptions/http_exception.dart';
import 'package:voleep_carclean_frontend/core/extensions/dio_exception_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/http/http_interceptor.dart';
import 'package:voleep_carclean_frontend/shared/models/generic_response_model.dart';

part 'http_client.g.dart';

@Riverpod(keepAlive: true)
HttpClient httpClient(HttpClientRef ref) {
  final httpInterceptor = ref.watch(httpInterceptorProvider);
  return HttpClient(dio: Dio()..interceptors.add(httpInterceptor));
}

class HttpClient {
  static const dioAuthKey = "DIO_AUTH_KEY";

  final Dio dio;

  HttpClient({required this.dio});

  HttpClient get auth {
    dio.options.extra[dioAuthKey] = true;
    return this;
  }

  HttpClient get unAuth {
    dio.options.extra[dioAuthKey] = false;
    return this;
  }

  Future<Either<HttpException, GenericResponse<T>>> get<T>(
    String path, {
    T Function(Map<String, dynamic>)? fromJsonT,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );

      if (fromJsonT != null) {
        return Success(GenericResponse<T>.fromJsonT(response.data, fromJsonT));
      }

      return Success(GenericResponse<T>.fromJson(response.data));
    } on DioException catch (exception, stackTrace) {
      return Failure(_handleDioException(exception), stackTrace);
    } catch (error, stackTrace) {
      return Failure(
          HttpUnknownException(message: error.toString()), stackTrace);
    }
  }

  Future<Either<HttpException, GenericResponse<T>>> post<T>(
    String path, {
    Object? data,
    T Function(Map<String, dynamic>)? fromJsonT,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: json.encode(data),
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );

      if (fromJsonT != null) {
        return Success(GenericResponse<T>.fromJsonT(response.data, fromJsonT));
      }

      return Success(GenericResponse.fromJson(response.data));
    } on DioException catch (exception, stackTrace) {
      return Failure(_handleDioException(exception), stackTrace);
    } catch (error, stackTrace) {
      return Failure(
          HttpUnknownException(message: error.toString()), stackTrace);
    }
  }

  Future<Either<HttpException, GenericResponse<T>>> put<T>(
    String path, {
    Object? data,
    T Function(Map<String, dynamic>)? fromJsonT,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: json.encode(data),
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );

      if (fromJsonT != null) {
        return Success(GenericResponse<T>.fromJsonT(response.data, fromJsonT));
      }

      return Success(GenericResponse.fromJson(response.data));
    } on DioException catch (exception, stackTrace) {
      return Failure(_handleDioException(exception), stackTrace);
    } catch (error, stackTrace) {
      return Failure(
          HttpUnknownException(message: error.toString()), stackTrace);
    }
  }

  HttpException _handleDioException(DioException exception) {
    final DioException(:type, :message) = exception;

    switch (type) {
      case DioExceptionType.connectionTimeout:
        return HttpConnectionErrorException(
          message: message ?? ErrorMessages.connectionTimeout,
        );
      case DioExceptionType.sendTimeout:
        return HttpSendTimeoutException(
          message: message ?? ErrorMessages.sendTimeout,
        );
      case DioExceptionType.receiveTimeout:
        return HttpReceiveTimeoutException(
          message: message ?? ErrorMessages.receiveTimeout,
        );
      case DioExceptionType.badCertificate:
        return HttpBadCertificateException(
          message: message ?? ErrorMessages.badCertificate,
        );
      case DioExceptionType.badResponse:
        {
          const defautMessage = ErrorMessages.badResponse;
          return HttpBadResponseException(
            message: exception.responseMessage ?? message ?? defautMessage,
          );
        }
      case DioExceptionType.cancel:
        return HttpCancelException(
          message: message ?? ErrorMessages.cancel,
        );
      case DioExceptionType.connectionError:
        return HttpConnectionErrorException(
          message: message ?? ErrorMessages.connectionError,
        );
      case DioExceptionType.unknown:
        return HttpUnknownException(
          message: message ?? ErrorMessages.unknown,
        );
    }
  }
}
