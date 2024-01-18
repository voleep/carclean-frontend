import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/providers/uuid.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/entities/service_model.dart';
import 'package:voleep_carclean_frontend/modules/service/service_routes.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/states/service_order_item_state.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_edit_page/service_order_edit_vm.dart';

part 'service_order_items_vm.g.dart';

@riverpod
class ServiceOrderItemsVm extends _$ServiceOrderItemsVm {
  @override
  List<ServiceOrderItemState> build(String id) {
    return ref.watch(serviceOrderEditVmProvider(id).select((s) => s.items));
  }

  @override
  set state(newState) {
    ref.read(serviceOrderEditVmProvider(id).notifier).changeItems(newState);
  }

  addAll(List<ServiceModel> services) {
    final items = services.map(
      (service) => ServiceOrderItemState(
        uuid: ref.read(uuidProvider).v4(),
        number: 1,
        service: service,
        price: service.price,
      ),
    );

    final newState = [...state, ...items];

    state = newState;
  }

  remove(ServiceOrderItemState item) {
    final newState = [...state];
    newState.remove(item);
    state = [...newState];
  }

  change(ServiceOrderItemState item) {
    final index = state.indexWhere((it) => it.uuid == item.uuid);
    if (index == -1) return;

    final newState = [...state];
    newState.replaceRange(index, index + 1, [item]);
    state = newState;
  }

  selectServices(BuildContext context) async {
    final response = await context.push(ServiceRoutes.selectMulti);
    if (response is List<ServiceModel>) {
      addAll(response);
    }
  }
}
