import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/constants/strings.dart';
import 'package:voleep_carclean_frontend/core/exceptions/http_exception.dart';
import 'package:voleep_carclean_frontend/core/exceptions/repository_exception.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/modules/service/data/models/create_service_model.dart';
import 'package:voleep_carclean_frontend/modules/service/data/models/service_model.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/entities/service.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/shared/models/generic_response_model.dart';

part 'service_repository.g.dart';

@riverpod
ServiceRepository serviceRepository(ServiceRepositoryRef ref) => ServiceRepository(
      http: ref.read(httpClientProvider),
    );

class ServiceRepository {
  final HttpClient http;

  final String endpoint = "${ApiConfig.CARCLEAN_API_URL}/service";

  ServiceRepository({required this.http});

  Future<Either<RepositoryException, Service>> findById(ServiceId serviceId) async {
    final getServiceResult = await http.get<ServiceModel>(
      "$endpoint/$serviceId",
      fromJsonT: ServiceModel.fromJson,
    );

    switch (getServiceResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(
            RepositoryException(message: Strings.servicoNaoEncontrado),
            StackTrace.current,
          );
        }

        return Success(
          Service(
            serviceId: data.serviceId,
            code: data.code,
            description: data.description,
            fullDescription: data.fullDescription,
            price: data.price,
            pcCommission: data.pcCommission,
          ),
        );
      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
            RepositoryException(message: exception.message ?? Strings.erroAoCarregarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(message: Strings.erroAoCarregarDados),
          stackTrace,
        );
    }
  }

  Future<Either<RepositoryException, Service>> saveOrUpdate(CreateServiceModel createServiceModel) async {
    if (createServiceModel.serviceId != null) {
      return update(createServiceModel);
    }
    return save(createServiceModel);
  }

  Future<Either<RepositoryException, Service>> save(CreateServiceModel createServiceModel) async {
    final createServiceResult = await http.post<ServiceModel>(
      endpoint,
      data: createServiceModel.toJson(),
      fromJsonT: ServiceModel.fromJson,
    );

    switch (createServiceResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(
            RepositoryException(message: Strings.erroAoSalvarDados),
            StackTrace.current,
          );
        }

        return Success(
          Service(
            serviceId: data.serviceId,
            code: data.code,
            description: data.description,
            fullDescription: data.fullDescription,
            price: data.price,
            pcCommission: data.pcCommission,
          ),
        );
      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
            RepositoryException(message: exception.message ?? Strings.erroAoSalvarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(message: Strings.erroAoSalvarDados),
          stackTrace,
        );
    }
  }

  Future<Either<RepositoryException, Service>> update(CreateServiceModel createServiceModel) async {
    final updateServiceResult = await http.put<ServiceModel>(
      endpoint,
      data: createServiceModel.toJson(),
      fromJsonT: ServiceModel.fromJson,
    );

    switch (updateServiceResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(
            RepositoryException(message: Strings.erroAoSalvarDados),
            StackTrace.current,
          );
        }

        return Success(
          Service(
            serviceId: data.serviceId,
            code: data.code,
            description: data.description,
            fullDescription: data.fullDescription,
            price: data.price,
            pcCommission: data.pcCommission,
          ),
        );
      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
            RepositoryException(message: exception.message ?? Strings.erroAoSalvarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(message: Strings.erroAoSalvarDados),
          stackTrace,
        );
    }
  }
}
