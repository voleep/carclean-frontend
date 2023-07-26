import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_item_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_product_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_model.dart';

part 'service_order_model.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class ServiceOrderModel extends Equatable {
  final CustomerModel customer;
  final VehicleModel vehicle;
  final double discountTotal;
  final double netTotal;
  final double grossTotal;
  final double postingDate;
  final List<ServiceOrderItemModel> serviceOrderItemList;
  final List<ServiceOrderProductModel> serviceOrderProductList;

  const ServiceOrderModel({
    required this.customer,
    required this.vehicle,
    required this.discountTotal,
    required this.netTotal,
    required this.grossTotal,
    required this.postingDate,
    required this.serviceOrderItemList,
    required this.serviceOrderProductList,
  });

  factory ServiceOrderModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceOrderModelFromJson(json);

  @override
  List<Object?> get props => [
        customer,
        vehicle,
        discountTotal,
        netTotal,
        grossTotal,
        postingDate,
        serviceOrderItemList,
        serviceOrderProductList,
      ];
}
