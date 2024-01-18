import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/customer/data/dtos/customer_api_dto.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/license_plate.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_id.dart';

part 'vehicle_api_dto.g.dart';

@JsonSerializable()
class VehicleApiDto {
  final VehicleId vehicleId;

  final LicensePlate licensePlate;

  final String description;

  final String? modelYear;

  final CustomerApiDto? customer;

  const VehicleApiDto({
    required this.vehicleId,
    required this.licensePlate,
    required this.description,
    this.modelYear,
    this.customer,
  });

  factory VehicleApiDto.fromJson(Map<String, dynamic> json) =>
      _$VehicleApiDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleApiDtoToJson(this);

  VehicleModel toModel() {
    return VehicleModel(
      vehicleId: vehicleId,
      licensePlate: licensePlate,
      description: description,
      modelYear: modelYear,
      customer: customer?.toModel(),
    );
  }
}
