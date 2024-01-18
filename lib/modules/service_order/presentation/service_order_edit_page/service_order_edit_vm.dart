import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/modules/customer/customer_routes.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/states/service_order_item_state.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/states/service_order_state.dart';
import 'package:voleep_carclean_frontend/modules/service_order/service_order_routes.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/vehicle_routes.dart';

part 'service_order_edit_vm.g.dart';

@riverpod
class ServiceOrderEditVm extends _$ServiceOrderEditVm {
  @override
  ServiceOrderState build(String id) {
    return ServiceOrderState();
  }

  changeItems(List<ServiceOrderItemState> items) {
    state = state.copyWith(items: items);
  }

  selectCustomer(BuildContext context) async {
    final response = await context.push(CustomerRoutes.singleSelection);
    if (response is List<CustomerModel>) {
      state = state.copyWith(customer: response.firstOrNull);
    }
  }

  selectVehicle(BuildContext context) async {
    final response = await context.push(VehicleRoutes.singleSelection);
    if (response is List<VehicleModel>) {
      state = state.copyWith(vehicle: response.firstOrNull);
    }
  }

  goToServices(BuildContext context) async {
    final response = await context.push(ServiceOrderRoutes.services(id));
    if (response is List<ServiceOrderItemState>) {
      changeItems(response);
    }
  }
}
