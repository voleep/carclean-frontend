// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      productId: json['productId'] as String,
      code: json['code'] as int,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      availableStock: (json['availableStock'] as num).toDouble(),
      pcCommission: (json['pcCommission'] as num).toDouble(),
      situation: $enumDecode(_$DisabledEnabledEnumMap, json['situation']),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'code': instance.code,
      'description': instance.description,
      'price': instance.price,
      'availableStock': instance.availableStock,
      'pcCommission': instance.pcCommission,
      'situation': _$DisabledEnabledEnumMap[instance.situation]!,
    };

const _$DisabledEnabledEnumMap = {
  DisabledEnabled.disabled: 0,
  DisabledEnabled.enabled: 1,
};
