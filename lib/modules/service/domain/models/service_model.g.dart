// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      serviceId: json['serviceId'] as String,
      code: json['code'] as int,
      description: json['description'] as String,
      fullDescription: json['fullDescription'] as String,
      price: (json['price'] as num).toDouble(),
      pcCommission: (json['pcCommission'] as num).toDouble(),
    );
