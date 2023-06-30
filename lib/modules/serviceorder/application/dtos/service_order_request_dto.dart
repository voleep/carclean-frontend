import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/serviceorder/domain/typedefs/service_order_types.dart';

part 'service_order_request_dto.g.dart';

@JsonSerializable(createFactory: false)
class ServiceOrderRequestDTO {
  final ServiceOrderId? serviceOrderId;
  final String description;
  final String fullDescription;
  final double price;

  const ServiceOrderRequestDTO({
    this.serviceOrderId,
    required this.description,
    required this.fullDescription,
    required this.price,
  });

  Map<String, dynamic> toJson() => _$ServiceOrderRequestDTOToJson(this);
}
