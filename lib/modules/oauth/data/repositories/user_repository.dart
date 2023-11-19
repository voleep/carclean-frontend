import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/core/exceptions/auth_exception.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/dtos/create_login_dto.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/dtos/create_user_dto.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/models/auth_model.dart';
import 'package:voleep_carclean_frontend/shared/models/generic_response_model.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) => UserRepository(
      http: ref.read(httpClientProvider),
    );

class UserRepository {
  get endpoint => "${ApiConfig.OAUTH_API_URL}/user";

  final HttpClient http;

  const UserRepository({required this.http});

  Future<Either<AuthException, AuthModel>> signIn(
      {required String email, required String password}) async {
    final response = await http.unAuth.post(
      "$endpoint/login",
      data: CreateLoginDTO(dsEmail: email, dsPassword: password).toJson(),
    );

    return switch (response) {
      Success(value: GenericResponse(:final data)) =>
        Success(AuthModel.fromJson(data)),
      Failure(:final exception, :final stackTrace) => Failure(
          AuthError(message: exception.message),
          stackTrace,
        )
    };
  }

  Future<Either<AuthException, AuthModel>> signUp(
      {required final CreateUserDTO createUserDTO}) async {
    final response = await http.unAuth.post(
      "$endpoint/create-account",
      data: createUserDTO.toJson(),
    );

    return switch (response) {
      Success(value: GenericResponse(:final data)) =>
        Success(AuthModel.fromJson(data)),
      Failure(:final exception, :final stackTrace) => Failure(
          AuthError(message: exception.message),
          stackTrace,
        )
    };
  }

  Future<Either<AuthException, AuthModel>> refreshToken({
    required String token,
    required String refreshToken,
  }) async {
    final header = {
      "Expired-Token": token,
      "Refresh-Token": refreshToken,
    };

    final response = await http.unAuth.post(
      "$endpoint/refresh-token",
      headers: header,
    );

    return switch (response) {
      Success(value: GenericResponse(:final data)) =>
        Success(AuthModel.fromJson(data)),
      Failure(:final exception, :final stackTrace) => Failure(
          AuthError(message: exception.message),
          stackTrace,
        )
    };
  }
}
