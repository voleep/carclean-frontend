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
import 'package:voleep_carclean_frontend/core/config/api_config.dart';
import 'package:voleep_carclean_frontend/shared/enums/http_method.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/models/generic_response_model.dart';
import 'package:voleep_carclean_frontend/shared/models/page_response.dart';

part 'service_repository.g.dart';

@riverpod
ServiceRepository serviceRepository(ServiceRepositoryRef ref) =>
    ServiceRepository(
      http: ref.read(httpClientProvider),
    );

class ServiceRepository {
  final HttpClient http;

  final String endpoint = "${ApiConfig.CARCLEAN_API_URL}/service";

  ServiceRepository({required this.http});

  Future<Either<RepositoryException, Service>> findById(
      ServiceId serviceId) async {
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
            RepositoryException(
                message: exception.message ?? Strings.erroAoCarregarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(message: Strings.erroAoCarregarDados),
          stackTrace,
        );
    }
  }

  FutureOr<Either<RepositoryException, PageResponse<Service>>> getPage(
      List<Filter> filters) async {
    final getPageResult = await http.auth.get<PageResponse<ServiceModel>>(
      endpoint,
      fromJsonT: (json) => PageResponse.fromJson(json, ServiceModel.fromJson),
      queryParameters: {
        "search": "orderDirection:ASC,orderField:description,${filters.query}"
      },
    );

    switch (getPageResult) {
      case Success(value: GenericResponse(:final data)):
        return Success(
          PageResponse(
            numberOfItems: data!.numberOfItems,
            numberOfPages: data.numberOfPages,
            currentPage: data.currentPage,
            pageData: data.pageData
                .map(
                  (service) => Service(
                    serviceId: service.serviceId,
                    code: service.code,
                    description: service.description,
                    fullDescription: service.fullDescription,
                    price: service.price,
                    pcCommission: service.pcCommission,
                  ),
                )
                .toList(),
          ),
        );
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

  Future<Either<RepositoryException, Service>> save(
      CreateServiceModel dto, bool isNew) async {
    final saveResult = await http.request<ServiceModel>(
      endpoint,
      method: isNew ? HttpMethod.post : HttpMethod.put,
      data: dto.toJson(),
      fromJsonT: ServiceModel.fromJson,
    );

    switch (saveResult) {
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
            RepositoryException(
                message: exception.message ?? Strings.erroAoSalvarDados),
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
