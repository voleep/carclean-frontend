// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceOrderModel _$ServiceOrderModelFromJson(Map<String, dynamic> json) =>
    ServiceOrderModel(
      serviceOrderId: json['serviceOrderId'] as String,
      code: json['code'] as int,
      description: json['description'] as String,
      fullDescription: json['fullDescription'] as String,
      price: (json['price'] as num).toDouble(),
    );
