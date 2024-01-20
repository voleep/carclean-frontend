import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/modules/employee/infra/dtos/employee_api_dto.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/entities/service_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/typedefs/service_order_typedefs.dart';

part 'service_order_item_model.freezed.dart';

@freezed
class ServiceOrderItemModel with _$ServiceOrderItemModel {
  const factory ServiceOrderItemModel({
    ServiceOrderItemId? serviceOrderItemId,
    required ServiceModel service,
    Employee? employee,
    required double price,
  }) = _ServiceOrderItemModel;
}
