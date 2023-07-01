import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:voleep_carclean_frontend/core/exceptions/dio_exceptions.dart';
import 'package:voleep_carclean_frontend/shared/models/request_response_model.dart';

class HttpClient {
  final Dio dio;

  HttpClient({required this.dio});

  Future<RequestResponseModel<dynamic>> get(String url) async {
    try {
      final response = await dio.get(url);
      RequestResponseModel<dynamic> apiResponse = RequestResponseModel.fromJson(response.data, (data) => data as dynamic);

      return apiResponse;
    } on DioException catch (exception) {
      final String errorMessage = DioExceptions.extractMessage(exception).toString();
      throw ErrorHint(errorMessage);
    }
  }

  Future<RequestResponseModel<dynamic>> post(String url, {Map<String, dynamic>? headers, required data, encoding}) async {
    try {
      final response = await dio.post(url, data: json.encode(data));
      RequestResponseModel<dynamic> apiResponse = RequestResponseModel.fromJson(response.data, (data) => data as dynamic);

      return apiResponse;
    } on DioException catch (exception) {
      final String errorMessage = DioExceptions.extractMessage(exception).toString();
      throw ErrorHint(errorMessage);
    }
  }

  Future<RequestResponseModel<dynamic>> put(String url, {Map<String, dynamic>? headers, required data, encoding}) async {
    try {
      final response = await dio.put(url, data: json.encode(data));
      RequestResponseModel<dynamic> apiResponse = RequestResponseModel.fromJson(response.data, (data) => data as dynamic);

      return apiResponse;
    } on DioException catch (exception) {
      final String errorMessage = DioExceptions.extractMessage(exception).toString();
      throw ErrorHint(errorMessage);
    }
  }
}
