// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VehicleModel _$$_VehicleModelFromJson(Map<String, dynamic> json) =>
    _$_VehicleModel(
      vehicleId: json['vehicleId'] as String?,
      licensePlate: json['licensePlate'] as String,
      description: json['description'] as String,
      modelYear: json['modelYear'] as String?,
      customer: json['customer'] == null
          ? null
          : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_VehicleModelToJson(_$_VehicleModel instance) =>
    <String, dynamic>{
      'vehicleId': instance.vehicleId,
      'licensePlate': instance.licensePlate,
      'description': instance.description,
      'modelYear': instance.modelYear,
      'customer': instance.customer,
    };
