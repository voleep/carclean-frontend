import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:voleep_carclean_frontend/core/exceptions/dio_exceptions.dart';
import 'package:voleep_carclean_frontend/shared/models/request_response_model.dart';

class HttpClient {
  final Dio dio;

  HttpClient({required this.dio});

  Future<RequestResponseModel<Map<String, dynamic>?>> get(String url) async {
    try {
      final response = await dio.get(url);
      RequestResponseModel<Map<String, dynamic>?> apiResponse =
          RequestResponseModel.fromJson(
              response.data, (data) => data as Map<String, dynamic>?);

      return apiResponse;
    } on DioError catch (error) {
      final String errorMessage =
          DioExceptions.fromDioError(dioError: error).toString();
      if (kDebugMode) {
        print(error.message);
      }

      throw Exception(errorMessage);
    }
  }

  Future<RequestResponseModel<Map<String, dynamic>?>> post(String url,
      {Map<String, dynamic>? headers, required data, encoding}) async {
    try {
      final response = await dio.post(url, data: json.encode(data));
      RequestResponseModel<Map<String, dynamic>?> apiResponse =
          RequestResponseModel.fromJson(
              response.data, (data) => data as Map<String, dynamic>?);

      return apiResponse;
    } on DioError catch (error) {
      final String errorMessage =
          DioExceptions.fromDioError(dioError: error).toString();
      if (kDebugMode) {
        print(error.message);
      }

      throw Exception(errorMessage);
    }
  }

  Future<RequestResponseModel<Map<String, dynamic>?>> put(String url,
      {Map<String, dynamic>? headers, required data, encoding}) async {
    try {
      final response = await dio.put(url, data: json.encode(data));
      RequestResponseModel<Map<String, dynamic>?> apiResponse =
          RequestResponseModel.fromJson(
              response.data, (data) => data as Map<String, dynamic>?);

      return apiResponse;
    } on DioError catch (error) {
      final String errorMessage =
          DioExceptions.fromDioError(dioError: error).toString();
      if (kDebugMode) {
        print(error.message);
      }

      throw Exception(errorMessage);
    }
  }
}
