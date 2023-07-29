// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      productId: json['productId'] as String,
      code: json['code'] as int,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      availableStock: (json['availableStock'] as num).toDouble(),
      pcCommission: (json['pcCommission'] as num).toDouble(),
      situation: json['situation'] as int,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'code': instance.code,
      'description': instance.description,
      'price': instance.price,
      'availableStock': instance.availableStock,
      'pcCommission': instance.pcCommission,
      'situation': instance.situation,
    };
