// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateProductModelToJson(CreateProductModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
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
