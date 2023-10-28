import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/data/models/employee_model.dart';
import 'package:voleep_carclean_frontend/modules/service/data/models/service_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/typedefs/service_order_typedefs.dart';

part 'service_order_item_model.freezed.dart';
part 'service_order_item_model.g.dart';

@freezed
class ServiceOrderItemModel with _$ServiceOrderItemModel {
  const factory ServiceOrderItemModel({
    ServiceOrderItemId? serviceOrderItemId,
    required ServiceModel service,
    EmployeeModel? employee,
    required double price,
  }) = _ServiceOrderItemModel;

  factory ServiceOrderItemModel.fromJson(Map<String, dynamic> json) => _$ServiceOrderItemModelFromJson(json);
}
