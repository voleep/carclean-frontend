import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_item_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_product_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/shared/converters/timestamp_converter.dart';

part 'service_order_model.freezed.dart';
part 'service_order_model.g.dart';

@freezed
class ServiceOrderModel with _$ServiceOrderModel {
  const factory ServiceOrderModel({
    required CustomerModel customer,
    required VehicleModel vehicle,
    required double discountTotal,
    required double netTotal,
    required double grossTotal,
    @Timestamp() required DateTime postingDate,
    required List<ServiceOrderItemModel> serviceOrderItemList,
    required List<ServiceOrderProductModel> serviceOrderProductList,
  }) = _ServiceOrderModel;

  factory ServiceOrderModel.fromJson(Map<String, dynamic> json) => _$ServiceOrderModelFromJson(json);
}
