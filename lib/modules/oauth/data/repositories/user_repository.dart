import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/core/exceptions/auth_exception.dart';
import 'package:voleep_carclean_frontend/core/exceptions/dio_exceptions.dart';
import 'package:voleep_carclean_frontend/core/extensions/dio_exception_extension.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/dtos/create_login_dto.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/dtos/create_user_dto.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/models/auth_model.dart';
import 'package:voleep_carclean_frontend/shared/models/generic_response_model.dart';

class UserRepository {
  get endpoint => "${ApiConfig.OAUTH_API_URL}/user";

  final Dio dio = Dio();

  UserRepository();

  Future<Either<AuthException, AuthModel>> signIn({required String email, required String password}) async {
    try {
      final Response(:data) = await dio.post(
        "$endpoint/login",
        data: CreateLoginDTO(dsEmail: email, dsPassword: password).toJson(),
      );

      if (data == null) {
        return Failure(AuthError(message: "Erro ao realizar login"), StackTrace.current);
      }

      final GenericResponse(data: authModel) = GenericResponse<AuthModel>.fromJsonT(data, AuthModel.fromJson);

      if (authModel == null) {
        return Failure(AuthError(message: "Erro ao realizar login"), StackTrace.current);
      }

      return Success(authModel);
    } on DioException catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      return Failure(AuthError(message: e.responseMessage ?? ""), s);
    } on Exception catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      return Failure(AuthError(message: e.message), s);
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

      final AuthModel authModel = GenericResponse<AuthModel>.fromJsonT(
        response.data,
        (data) => AuthModel.fromJson(data as Map<String, dynamic>),
      ).data!;

      return authModel;
    } on DioException catch (exception) {
      final String errorMessage = DioExceptions.extractMessage(exception).toString();
      throw ErrorHint(errorMessage);
    }
  }

  Future<AuthModel> refreshToken({
    required String token,
    required String refreshToken,
  }) async {
    dio.options.headers["Expired-Token"] = token;
    dio.options.headers["Refresh-Token"] = refreshToken;

    try {
      final Response<dynamic> response = await dio.post("$endpoint/refresh-token");

      final newOAuthModel = AuthModel.fromJson(response.data);

      return newOAuthModel;
    } on DioException catch (exception) {
      final String errorMessage = DioExceptions.extractMessage(exception).toString();
      throw ErrorHint(errorMessage);
    }
  }
}
