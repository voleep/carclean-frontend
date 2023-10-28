// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      vehicleId: json['vehicleId'] as String,
      licensePlate: json['licensePlate'] as String,
      description: json['description'] as String,
      modelYear: json['modelYear'] as String?,
      customer: json['customer'] == null
          ? null
          : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'vehicleId': instance.vehicleId,
      'licensePlate': instance.licensePlate,
      'description': instance.description,
      'modelYear': instance.modelYear,
      'customer': instance.customer,
    };
