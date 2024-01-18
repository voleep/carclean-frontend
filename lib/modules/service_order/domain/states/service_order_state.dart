import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/states/service_order_item_state.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_model.dart';

part 'service_order_state.freezed.dart';

@freezed
abstract class ServiceOrderState with _$ServiceOrderState {
  factory ServiceOrderState({
    CustomerModel? customer,
    VehicleModel? vehicle,
    @Default([]) List<ServiceOrderItemState> items,
  }) = _ServiceOrderState;

  static ServiceOrderState fromModel(ServiceOrderModel model) {
    return ServiceOrderState(
      customer: model.customer,
      vehicle: model.vehicle,
    );
  }
}
