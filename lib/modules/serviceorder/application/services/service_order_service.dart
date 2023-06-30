import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/core/http/providers/http_client_provider.dart';
import 'package:voleep_carclean_frontend/modules/serviceorder/application/dtos/service_order_request_dto.dart';
import 'package:voleep_carclean_frontend/modules/serviceorder/domain/models/service_order_model.dart';
import 'package:voleep_carclean_frontend/modules/serviceorder/domain/typedefs/service_order_types.dart';
part 'service_order_service.g.dart';

@riverpod
ServiceOrderService serviceOrderService(ServiceOrderServiceRef ref) => ServiceOrderService(http: ref.watch(httpClientProvider));

class ServiceOrderService {
  ServiceOrderService({required this.http});

  final HttpClient http;

  get endpoint => "${ApiConfig.CARCLEAN_API_URL}/serviceorder";

  Future<ServiceOrderModel?> findById(ServiceOrderId serviceOrderId) async {
    final response = await http.get("$endpoint/$serviceOrderId");

    if (response.data == null) {
      return null;
    }

    return ServiceOrderModel.fromJson(response.data!);
  }

  Future<ServiceOrderModel?> save(ServiceOrderRequestDTO serviceOrderRequestDTO) async {
    final response = await http.post(endpoint, data: serviceOrderRequestDTO.toJson());

    if (response.data == null) {
      return null;
    }

    return ServiceOrderModel.fromJson(response.data!);
  }

  Future<ServiceOrderModel?> update(ServiceOrderRequestDTO serviceOrderRequestDTO) async {
    final response = await http.put(endpoint, data: serviceOrderRequestDTO.toJson());

    if (response.data == null) {
      return null;
    }

    return ServiceOrderModel.fromJson(response.data!);
  }
}
