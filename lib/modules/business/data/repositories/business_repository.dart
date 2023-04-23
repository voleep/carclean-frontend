import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/core/http/providers/http_client_provider.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/dtos/create_business_dto.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/models/auth_model.dart';
import 'package:voleep_carclean_frontend/shared/models/request_response_model.dart';

class BusinessRepository {
  get endpoint => "${ApiConfig.OAUTH_API_URL}/business";

  final HttpClient http;

  BusinessRepository({required this.http});

  Future<AuthModel> createBusiness(
      {required CreateBusinessDTO createBusinessDTO}) async {
    final response = await http.post(
      endpoint,
      data: createBusinessDTO.toJson(),
    );

    if (response.data == null) {
      throw Exception("Ocorreu um erro.");
    }

    final AuthModel authModel = RequestResponseModel<AuthModel>.fromJson(
      response.data!,
      (data) => AuthModel.fromJson(data as Map<String, dynamic>),
    ).data!;

    return authModel;
  }
}
