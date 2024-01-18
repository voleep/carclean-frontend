import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';

part 'service_api_dto.g.dart';

@JsonSerializable()
class ServiceApiDto {
  final ServiceId serviceId;

  final int code;

  final String description;

  final String fullDescription;

  final double price;

  final double pcCommission;

  const ServiceApiDto({
    required this.serviceId,
    required this.code,
    required this.description,
    required this.fullDescription,
    required this.price,
    required this.pcCommission,
  });

  factory ServiceApiDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceApiDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceApiDtoToJson(this);
}
