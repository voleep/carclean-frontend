import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_typedefs.dart';

part 'vehicle_request_model.freezed.dart';
part 'vehicle_request_model.g.dart';

@freezed
class VehicleRequestModel with _$VehicleRequestModel {
  const factory VehicleRequestModel({
    VehicleId? vehicleId,
    required LicensePlate licensePlate,
    required String description,
    String? modelYear,
    CustomerModel? customer,
  }) = _VehicleRequestModel;

  factory VehicleRequestModel.fromJson(Map<String, dynamic> json) => _$VehicleRequestModelFromJson(json);
}
