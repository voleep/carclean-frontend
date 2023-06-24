import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_typedefs.dart';
part 'update_vehicle_dto.g.dart';

@immutable
@JsonSerializable(createFactory: false)
class UpdateVehicleDTO extends Equatable {
  final VehicleId vehicleId;
  final LicensePlate licensePlate;
  final String? description;

  const UpdateVehicleDTO({
    required this.vehicleId,
    required this.licensePlate,
    this.description,
  });

  Map<String, dynamic> toJson() => _$UpdateVehicleDTOToJson(this);

  @override
  List<Object?> get props => [licensePlate, description];
}
