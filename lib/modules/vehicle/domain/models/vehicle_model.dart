import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_typedefs.dart';
part 'vehicle_model.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class VehicleModel extends Equatable {
  final VehicleId vehicleId;
  final LicensePlate licensePlate;
  final String? description;

  const VehicleModel({
    required this.vehicleId,
    required this.licensePlate,
    this.description,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);

  @override
  List<Object?> get props => [
        vehicleId,
        licensePlate,
        description,
      ];
}
