import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/license_plate.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_id.dart';

part 'create_vehicle_model.g.dart';

@JsonSerializable(createFactory: false)
class CreateVehicleModel {
  final VehicleId? vehicleId;

  final LicensePlate licensePlate;

  final String description;

  final String? modelYear;

  final CustomerModel? customer;

  const CreateVehicleModel({
    this.vehicleId,
    required this.licensePlate,
    required this.description,
    this.modelYear,
    this.customer,
  });

  Map<String, dynamic> toJson() => _$CreateVehicleModelToJson(this);
}
