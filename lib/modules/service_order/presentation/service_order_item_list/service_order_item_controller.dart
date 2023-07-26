import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/models/employee_model.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/models/service_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_item_model.dart';

part 'service_order_item_controller.g.dart';

@riverpod
class ServiceOrderItemController extends _$ServiceOrderItemController {
  @override
  List<ServiceOrderItemModel> build() {
    return [];
  }

  addService(ServiceModel service) {
    final serviceOrderItem =
        ServiceOrderItemModel(service: service, price: service.price);
    state = [...state, serviceOrderItem];
  }

  _updateServiceItem(int index, ServiceOrderItemModel newItem) {
    final newState = [...state];
    newState.replaceRange(index, index + 1, [newItem]);
    state = newState;
  }

  handleEmployeeChanged(int index, EmployeeModel? employeeModel) {
    final item = state[index];
    _updateServiceItem(index, item.copyWith(employee: employeeModel));
  }

  handlePriceChanged(int index, double price) {
    final item = state[index];
    _updateServiceItem(index, item.copyWith(price: price));
  }
}
