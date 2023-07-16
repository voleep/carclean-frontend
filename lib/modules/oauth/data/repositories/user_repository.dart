import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/core/exceptions/dio_exceptions.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/dtos/create_login_dto.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/dtos/create_user_dto.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/models/auth_model.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/typedefs/user_refresh_token.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/typedefs/user_token.dart';
import 'package:voleep_carclean_frontend/shared/models/request_response_model.dart';

class UserRepository {
  get endpoint => "${ApiConfig.OAUTH_API_URL}/user";

  final Dio dio = Dio();

  UserRepository();

  Future<AuthModel> signIn(
      {required String email, required String password}) async {
    try {
      final response = await dio.post(
        "$endpoint/login",
        data: CreateLoginDTO(
          dsEmail: email,
          dsPassword: password,
        ).toJson(),
      );

      if (response.data == null) {
        throw Exception("Ocorreu um erro.");
      }

      final AuthModel authModel = RequestResponseModel<AuthModel>.fromJson(
        response.data,
        (data) => AuthModel.fromJson(data as Map<String, dynamic>),
      ).data!;

      return authModel;
    } on DioException catch (exception) {
      final String errorMessage =
          DioExceptions.extractMessage(exception).toString();
      throw ErrorHint(errorMessage);
    }
  }

  Future<AuthModel> signUp({required final CreateUserDTO createUserDTO}) async {
    try {
      final response = await dio.post(
        "$endpoint/create-account",
        data: createUserDTO.toJson(),
      );

      if (response.data == null) {
        throw Exception("Ocorreu um erro");
      }

      final AuthModel authModel = RequestResponseModel<AuthModel>.fromJson(
        response.data,
        (data) => AuthModel.fromJson(data as Map<String, dynamic>),
      ).data!;

      return authModel;
    } on DioException catch (exception) {
      final String errorMessage =
          DioExceptions.extractMessage(exception).toString();
      throw ErrorHint(errorMessage);
    }
  }

  Future<AuthModel> refreshToken({
    required UserToken token,
    required UserRefreshToken refreshToken,
  }) async {
    dio.options.headers["Expired-Token"] = token;
    dio.options.headers["Refresh-Token"] = refreshToken;

    try {
      final Response<dynamic> response =
          await dio.post("$endpoint/refresh-token");

      final newOAuthModel = AuthModel.fromJson(response.data);

      return newOAuthModel;
    } on DioException catch (exception) {
      final String errorMessage =
          DioExceptions.extractMessage(exception).toString();
      throw ErrorHint(errorMessage);
    }
  }
}
