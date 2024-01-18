import 'package:flutter/foundation.dart' show immutable;
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/license_plate.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_id.dart';

@immutable
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
}
