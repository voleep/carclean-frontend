// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceOrderItemModel _$$_ServiceOrderItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_ServiceOrderItemModel(
      serviceOrderItemId: json['serviceOrderItemId'] as String?,
      service: ServiceModel.fromJson(json['service'] as Map<String, dynamic>),
      employee: json['employee'] == null
          ? null
          : EmployeeModel.fromJson(json['employee'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ServiceOrderItemModelToJson(
        _$_ServiceOrderItemModel instance) =>
    <String, dynamic>{
      'serviceOrderItemId': instance.serviceOrderItemId,
      'service': instance.service,
      'employee': instance.employee,
      'price': instance.price,
    };
