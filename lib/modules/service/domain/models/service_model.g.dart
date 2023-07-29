// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceModel _$$_ServiceModelFromJson(Map<String, dynamic> json) =>
    _$_ServiceModel(
      serviceId: json['serviceId'] as String,
      code: json['code'] as int,
      description: json['description'] as String,
      fullDescription: json['fullDescription'] as String,
      price: (json['price'] as num).toDouble(),
      pcCommission: (json['pcCommission'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ServiceModelToJson(_$_ServiceModel instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'code': instance.code,
      'description': instance.description,
      'fullDescription': instance.fullDescription,
      'price': instance.price,
      'pcCommission': instance.pcCommission,
    };
