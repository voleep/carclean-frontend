import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/modules/employee/infra/dtos/employee_api_dto.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/entities/service_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_item_model.dart';

part 'service_order_item_state.freezed.dart';

@freezed
abstract class ServiceOrderItemState with _$ServiceOrderItemState {
  factory ServiceOrderItemState({
    required String uuid,
    required int number,
    required ServiceModel service,
    required double price,
    Employee? employee,
  }) = _ServiceOrderItemState;

  static ServiceOrderItemState fromModel(ServiceOrderItemModel model) {
    return ServiceOrderItemState(
      uuid: model.serviceOrderItemId!,
      number: 1,
      service: model.service,
      price: model.price,
      employee: model.employee,
    );
  }
}
