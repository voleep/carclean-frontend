// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_order_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceOrderProductModel _$ServiceOrderProductModelFromJson(
        Map<String, dynamic> json) =>
    ServiceOrderProductModel(
      serviceOrderProductId: json['serviceOrderProductId'] as String,
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      employee:
          EmployeeModel.fromJson(json['employee'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
    );
