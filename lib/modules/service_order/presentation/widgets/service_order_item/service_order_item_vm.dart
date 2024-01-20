import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/modules/employee/employee_routes.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/states/service_order_item_state.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_items_page/service_order_items_vm.dart';
import 'package:voleep_carclean_frontend/shared/utils/field_util.dart';

part 'service_order_item_vm.g.dart';

@riverpod
class ServiceOrderItemVm extends _$ServiceOrderItemVm {
  @override
  ServiceOrderItemState build(String uuid, String soUuid) {
    return ref.read(serviceOrderItemsVmProvider(soUuid).select(
      (state) => state.firstWhere((item) => item.uuid == uuid),
    ));
  }

  @override
  set state(newState) {
    final notifier = serviceOrderItemsVmProvider(soUuid).notifier;
    ref.read(notifier).change(newState);
    super.state = newState;
  }

  changePrice(String text) {
    final price = FieldUtil.realToDouble(text);
    state = state.copyWith(price: price);
  }

  selectEmployee(BuildContext context) async {
    final response = await context.push(EmployeeRoutes.singleSelection);
    if (response is List<Employee>) {
      state = state.copyWith(employee: response.first);
    }
  }

  removeSelf() {
    final notifier = serviceOrderItemsVmProvider(soUuid).notifier;
    ref.read(notifier).remove(state);
  }
}
