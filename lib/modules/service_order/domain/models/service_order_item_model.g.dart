// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceOrderItemModel _$ServiceOrderItemModelFromJson(
        Map<String, dynamic> json) =>
    ServiceOrderItemModel(
      serviceOrderItemId: json['serviceOrderItemId'] as String?,
      service: ServiceModel.fromJson(json['service'] as Map<String, dynamic>),
      employee: json['employee'] == null
          ? null
          : EmployeeModel.fromJson(json['employee'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
    );
