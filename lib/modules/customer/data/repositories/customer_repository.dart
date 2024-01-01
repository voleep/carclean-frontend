import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/config/api_config.dart';
import 'package:voleep_carclean_frontend/core/constants/strings.dart';
import 'package:voleep_carclean_frontend/core/exceptions/http_exception.dart';
import 'package:voleep_carclean_frontend/core/exceptions/repository_exception.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/modules/customer/data/dtos/create_customer_dto.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/shared/enums/http_method.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/models/generic_response_model.dart';
import 'package:voleep_carclean_frontend/shared/models/page_response.dart';

part 'customer_repository.g.dart';

@riverpod
CustomerRepository customerRepository(CustomerRepositoryRef ref) =>
    CustomerRepository(http: ref.read(httpClientProvider));

class CustomerRepository {
  final HttpClient http;

  CustomerRepository({required this.http});

  get endpoint {
    return "${ApiConfig.CARCLEAN_API_URL}/customer";
  }

  FutureOr<Either<RepositoryException, CustomerModel>> findById(
      String customerId) async {
    final getCustomerResult = await http.get("$endpoint/$customerId");

    switch (getCustomerResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(
              RepositoryException(message: Strings.clienteNaoEncontrado),
              StackTrace.current);
        }

        return Success(CustomerModel.fromJson(data));
      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
              RepositoryException(
                message: exception.message ?? Strings.erroCarregarCliente,
              ),
              stackTrace);
        }

        return Failure(
            RepositoryException(message: Strings.erroCarregarCliente),
            stackTrace);
    }
  }

  FutureOr<Either<RepositoryException, PageResponse<CustomerModel>>> getPage(
      int page, List<Filter> filters) async {
    final getPageResult = await http.auth.get<PageResponse<CustomerModel>>(
      endpoint,
      fromJsonT: (json) => PageResponse.fromJson(json, CustomerModel.fromJson),
      queryParameters: {
        "search":
            "orderDirection:ASC,orderField:dsName,page:$page,${filters.query}"
      },
    );

    switch (getPageResult) {
      case Success(value: GenericResponse(:final data)):
        return Success(data!);
      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
              RepositoryException(
                  message: exception.message ?? Strings.erroAoCarregarDados),
              stackTrace);
        }

        return Failure(
            RepositoryException(message: Strings.erroAoCarregarDados),
            stackTrace);
    }
  }

  Future<Either<RepositoryException, CustomerModel>> save(
      CreateCustomerDTO dto, bool isNew) async {
    final saveResponse = await http.request(
      endpoint,
      method: isNew ? HttpMethod.post : HttpMethod.put,
      data: dto.toJson(),
    );

    switch (saveResponse) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(
              RepositoryException(message: Strings.erroSalvarDadosCliente),
              StackTrace.current);
        }

        return Success(CustomerModel.fromJson(data));
      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
              RepositoryException(
                  message: exception.message ?? Strings.erroSalvarDadosCliente),
              stackTrace);
        }

        return Failure(
            RepositoryException(message: Strings.erroSalvarDadosCliente),
            stackTrace);
    }
  }
}
