// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceOrderModel _$ServiceOrderModelFromJson(Map<String, dynamic> json) =>
    ServiceOrderModel(
      customer:
          CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
      vehicle: VehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
      discountTotal: (json['discountTotal'] as num).toDouble(),
      netTotal: (json['netTotal'] as num).toDouble(),
      grossTotal: (json['grossTotal'] as num).toDouble(),
      postingDate: (json['postingDate'] as num).toDouble(),
      serviceOrderItemList: (json['serviceOrderItemList'] as List<dynamic>)
          .map((e) => ServiceOrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceOrderProductList:
          (json['serviceOrderProductList'] as List<dynamic>)
              .map((e) =>
                  ServiceOrderProductModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
