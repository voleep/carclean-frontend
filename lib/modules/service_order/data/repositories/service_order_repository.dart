import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/config/api_config.dart';
import 'package:voleep_carclean_frontend/core/exceptions/repository_exception.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/modules/service_order/data/dtos/service_order_api_dto.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/models/page_response.dart';

part 'service_order_repository.g.dart';

@riverpod
ServiceOrderRepository serviceOrderRepository(ServiceOrderRepositoryRef ref) {
  final http = ref.read(httpClientProvider);
  return ServiceOrderRepository(http);
}

class ServiceOrderRepository {
  final String endpoint = '${ApiConfig.CARCLEAN_API_URL}/service-order';

  final HttpClient http;

  ServiceOrderRepository(this.http);

  Future<Either<RepositoryException, PageResponse<ServiceOrderApiDto>>> getPage(
      List<Filter> query) async {
    final response = await http.get<PageResponse<ServiceOrderApiDto>>(
      endpoint,
      fromJsonT: (json) =>
          PageResponse.fromJson(json, ServiceOrderApiDto.fromJson),
      queryParameters: {
        "search": query,
      },
    );

    return switch (response) {
      Success(value: final response) => Success(response.data!),
      Failure(:final exception, :final stackTrace) => Failure(
          RepositoryException(exception.message),
          stackTrace,
        )
    };
  }
}
