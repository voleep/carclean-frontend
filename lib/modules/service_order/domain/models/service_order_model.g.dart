// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceOrderModel _$$_ServiceOrderModelFromJson(Map<String, dynamic> json) =>
    _$_ServiceOrderModel(
      customer:
          CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
      vehicle: VehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
      discountTotal: (json['discountTotal'] as num).toDouble(),
      netTotal: (json['netTotal'] as num).toDouble(),
      grossTotal: (json['grossTotal'] as num).toDouble(),
      postingDate: const Timestamp().fromJson(json['postingDate'] as int),
      serviceOrderItemList: (json['serviceOrderItemList'] as List<dynamic>)
          .map((e) => ServiceOrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceOrderProductList:
          (json['serviceOrderProductList'] as List<dynamic>)
              .map((e) =>
                  ServiceOrderProductModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$_ServiceOrderModelToJson(
        _$_ServiceOrderModel instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'vehicle': instance.vehicle,
      'discountTotal': instance.discountTotal,
      'netTotal': instance.netTotal,
      'grossTotal': instance.grossTotal,
      'postingDate': const Timestamp().toJson(instance.postingDate),
      'serviceOrderItemList': instance.serviceOrderItemList,
      'serviceOrderProductList': instance.serviceOrderProductList,
    };
