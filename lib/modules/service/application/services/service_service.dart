import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/core/http/providers/http_client_provider.dart';
import 'package:voleep_carclean_frontend/modules/service/application/dtos/service_request_dto.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/models/service_model.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';
part 'service_service.g.dart';

@riverpod
ServiceService serviceService(ServiceServiceRef ref) => ServiceService(http: ref.watch(httpClientProvider));

class ServiceService {
  ServiceService({required this.http});

  final HttpClient http;

  get endpoint => "${ApiConfig.CARCLEAN_API_URL}/service";

  Future<ServiceModel?> findById(ServiceId serviceId) async {
    final response = await http.get("$endpoint/$serviceId");

    if (response.data == null) {
      return null;
    }

    return ServiceModel.fromJson(response.data!);
  }

  Future<ServiceModel?> save(ServiceRequestDTO serviceRequestDTO) async {
    final response = await http.post(endpoint, data: serviceRequestDTO.toJson());

    if (response.data == null) {
      return null;
    }

    return ServiceModel.fromJson(response.data!);
  }

  Future<ServiceModel?> update(ServiceRequestDTO serviceRequestDTO) async {
    final response = await http.put(endpoint, data: serviceRequestDTO.toJson());

    if (response.data == null) {
      return null;
    }

    return ServiceModel.fromJson(response.data!);
  }
}
