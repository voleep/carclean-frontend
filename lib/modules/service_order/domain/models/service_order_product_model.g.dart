// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_order_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceOrderProductModel _$$_ServiceOrderProductModelFromJson(
        Map<String, dynamic> json) =>
    _$_ServiceOrderProductModel(
      serviceOrderProductId: json['serviceOrderProductId'] as String?,
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      employee: json['employee'] == null
          ? null
          : EmployeeModel.fromJson(json['employee'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ServiceOrderProductModelToJson(
        _$_ServiceOrderProductModel instance) =>
    <String, dynamic>{
      'serviceOrderProductId': instance.serviceOrderProductId,
      'product': instance.product,
      'employee': instance.employee,
      'quantity': instance.quantity,
      'price': instance.price,
    };
