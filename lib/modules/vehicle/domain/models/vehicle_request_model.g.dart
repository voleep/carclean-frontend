// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VehicleRequestModel _$$_VehicleRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_VehicleRequestModel(
      vehicleId: json['vehicleId'] as String?,
      licensePlate: json['licensePlate'] as String,
      description: json['description'] as String,
      modelYear: json['modelYear'] as String?,
      customer: json['customer'] == null
          ? null
          : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_VehicleRequestModelToJson(
        _$_VehicleRequestModel instance) =>
    <String, dynamic>{
      'vehicleId': instance.vehicleId,
      'licensePlate': instance.licensePlate,
      'description': instance.description,
      'modelYear': instance.modelYear,
      'customer': instance.customer,
    };
