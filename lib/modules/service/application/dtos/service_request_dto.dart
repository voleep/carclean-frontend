import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';

part 'service_request_dto.g.dart';

@JsonSerializable(createFactory: false)
class ServiceRequestDTO {
  final ServiceId? serviceId;
  final String description;
  final String fullDescription;
  final double price;

  const ServiceRequestDTO({
    this.serviceId,
    required this.description,
    required this.fullDescription,
    required this.price,
  });

  Map<String, dynamic> toJson() => _$ServiceRequestDTOToJson(this);
}
