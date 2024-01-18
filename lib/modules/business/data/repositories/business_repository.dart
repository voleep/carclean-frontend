import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/config/api_config.dart';
import 'package:voleep_carclean_frontend/core/constants/strings.dart';
import 'package:voleep_carclean_frontend/core/exceptions/http_exception.dart';
import 'package:voleep_carclean_frontend/core/exceptions/repository_exception.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/dtos/create_business_dto.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/models/auth_model.dart';
import 'package:voleep_carclean_frontend/shared/models/generic_response_model.dart';

part 'business_repository.g.dart';

@riverpod
BusinessRepository businessRepository(BusinessRepositoryRef ref) =>
    BusinessRepository(http: ref.read(httpClientProvider));

class BusinessRepository {
  get endpoint => "${ApiConfig.OAUTH_API_URL}/business";

  final HttpClient http;

  BusinessRepository({required this.http});

  Future<Either<RepositoryException, AuthModel>> createBusiness(
      {required CreateBusinessDTO createBusinessDTO}) async {
    final postResult =
        await http.post(endpoint, data: createBusinessDTO.toJson());

    switch (postResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(RepositoryException(Strings.erroCriarEmpresa),
              StackTrace.current);
        }

        return Success(AuthModel.fromJson(data));
      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
              RepositoryException(
                  exception.message ?? Strings.erroCriarEmpresa),
              stackTrace);
        }

        return Failure(
            RepositoryException(Strings.erroCriarEmpresa), stackTrace);
    }
  }
}
