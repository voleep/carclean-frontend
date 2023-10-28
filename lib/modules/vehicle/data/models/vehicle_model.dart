import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/license_plate.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_id.dart';

part 'vehicle_model.g.dart';

@JsonSerializable()
class VehicleModel {
  final VehicleId vehicleId;

  final LicensePlate licensePlate;

  final String description;

  final String? modelYear;

  final CustomerModel? customer;

  const VehicleModel({
    required this.vehicleId,
    required this.licensePlate,
    required this.description,
    this.modelYear,
    this.customer,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => _$VehicleModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);
}
