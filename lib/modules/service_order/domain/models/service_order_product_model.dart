import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/infra/dtos/employee_api_dto.dart';
import 'package:voleep_carclean_frontend/modules/product/data/models/product_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/typedefs/service_order_typedefs.dart';

part 'service_order_product_model.freezed.dart';

@freezed
class ServiceOrderProductModel with _$ServiceOrderProductModel {
  const factory ServiceOrderProductModel({
    ServiceOrderProductId? serviceOrderProductId,
    required ProductModel product,
    required EmployeeApiDto? employee,
    required double quantity,
    required double price,
  }) = _ServiceOrderProductModel;
}
