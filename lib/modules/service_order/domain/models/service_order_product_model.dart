import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/data/models/employee_model.dart';
import 'package:voleep_carclean_frontend/modules/product/data/models/product_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/typedefs/service_order_typedefs.dart';

part 'service_order_product_model.freezed.dart';
part 'service_order_product_model.g.dart';

@freezed
class ServiceOrderProductModel with _$ServiceOrderProductModel {
  const factory ServiceOrderProductModel({
    ServiceOrderProductId? serviceOrderProductId,
    required ProductModel product,
    required EmployeeModel? employee,
    required double quantity,
    required double price,
  }) = _ServiceOrderProductModel;

  factory ServiceOrderProductModel.fromJson(Map<String, dynamic> json) => _$ServiceOrderProductModelFromJson(json);
}
