import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/core/constants/strings.dart';
import 'package:voleep_carclean_frontend/core/exceptions/http_exception.dart';
import 'package:voleep_carclean_frontend/core/exceptions/repository_exception.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/modules/customer/data/dtos/create_customer_dto.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/typedefs/customer_id.dart';
import 'package:voleep_carclean_frontend/shared/models/generic_response_model.dart';

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

  Future<Either<RepositoryException, CustomerModel>> findById({required CustomerId customerId}) async {
    final getCustomerResult = await http.get("$endpoint/$customerId");

    switch (getCustomerResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(RepositoryException(message: Strings.clienteNaoEncontrado), StackTrace.current);
        }

        return Success(CustomerModel.fromJson(data));
      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(RepositoryException(message: exception.message ?? Strings.erroCarregarCliente), stackTrace);
        }

        return Failure(RepositoryException(message: Strings.erroCarregarCliente), stackTrace);
    }
  }

  Future<Either<RepositoryException, CustomerModel>> saveOrUpdate(CreateCustomerDTO createCustomerDTO) async {
    if (createCustomerDTO.idCustomer == null) {
      return save(createCustomerDTO);
    }

    return update(createCustomerDTO);
  }

  Future<Either<RepositoryException, CustomerModel>> save(CreateCustomerDTO createCustomerDTO) async {
    final createCustomerResult = await http.post(endpoint, data: createCustomerDTO.toJson());

    switch (createCustomerResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(RepositoryException(message: Strings.erroSalvarDadosCliente), StackTrace.current);
        }

        return Success(CustomerModel.fromJson(data));
      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(RepositoryException(message: exception.message ?? Strings.erroSalvarDadosCliente), stackTrace);
        }

        return Failure(RepositoryException(message: Strings.erroSalvarDadosCliente), stackTrace);
    }
  }

  Future<Either<RepositoryException, CustomerModel>> update(CreateCustomerDTO createCustomerDTO) async {
    final updateCustomerResult = await http.put(endpoint, data: createCustomerDTO.toJson());

    switch (updateCustomerResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(RepositoryException(message: Strings.erroAtualzarDadosCliente), StackTrace.current);
        }

        return Success(CustomerModel.fromJson(data));
      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
              RepositoryException(message: exception.message ?? Strings.erroAtualzarDadosCliente), stackTrace);
        }

        return Failure(RepositoryException(message: Strings.erroAtualzarDadosCliente), stackTrace);
    }
  }
}
