import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/config/api_config.dart';
import 'package:voleep_carclean_frontend/core/constants/strings.dart';
import 'package:voleep_carclean_frontend/core/exceptions/http_exception.dart';
import 'package:voleep_carclean_frontend/core/exceptions/repository_exception.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/modules/service/data/dtos/create_service_model.dart';
import 'package:voleep_carclean_frontend/modules/service/data/dtos/service_api_dto.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/entities/service_model.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';
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

  Future<Either<RepositoryException, ServiceModel>> findById(
      ServiceId serviceId) async {
    final getServiceResult = await http.get<ServiceApiDto>(
      "$endpoint/$serviceId",
      fromJsonT: ServiceApiDto.fromJson,
    );

    switch (getServiceResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(
            RepositoryException(Strings.servicoNaoEncontrado),
            StackTrace.current,
          );
        }

        return Success(
          ServiceModel(
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
                exception.message ?? Strings.erroAoCarregarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(Strings.erroAoCarregarDados),
          stackTrace,
        );
    }
  }

  FutureOr<Either<RepositoryException, PageResponse<ServiceModel>>> getPage(
      List<Filter> filters) async {
    final getPageResult = await http.auth.get<PageResponse<ServiceApiDto>>(
      endpoint,
      fromJsonT: (json) => PageResponse.fromJson(json, ServiceApiDto.fromJson),
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
                  (service) => ServiceModel(
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
                  exception.message ?? Strings.erroAoCarregarDados),
              stackTrace);
        }

        return Failure(
            RepositoryException(Strings.erroAoCarregarDados), stackTrace);
    }
  }

  Future<Either<RepositoryException, ServiceModel>> save(
      CreateServiceModel dto, bool isNew) async {
    final saveResult = await http.request<ServiceApiDto>(
      endpoint,
      method: isNew ? HttpMethod.post : HttpMethod.put,
      data: dto.toJson(),
      fromJsonT: ServiceApiDto.fromJson,
    );

    switch (saveResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(
            RepositoryException(Strings.erroAoSalvarDados),
            StackTrace.current,
          );
        }

        return Success(
          ServiceModel(
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
            RepositoryException(exception.message ?? Strings.erroAoSalvarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(Strings.erroAoSalvarDados),
          stackTrace,
        );
    }
  }
}
