import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/models/employee_model.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/models/service_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_item_model.dart';
import 'package:voleep_carclean_frontend/routing/routes/go_router_provider.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';

part 'service_order_item_controller.g.dart';

@riverpod
class ServiceOrderItemController extends _$ServiceOrderItemController {
  @override
  List<ServiceOrderItemModel> build() {
    return [];
  }

  setState(List<ServiceOrderItemModel> values) {
    state = values;
  }

  addService(ServiceModel service) {
    final serviceOrderItem = ServiceOrderItemModel(service: service, price: service.price);
    state = [...state, serviceOrderItem];
  }

  removeService(int index) {
    final newState = [...state];
    newState.removeAt(index);
    state = [...newState];
  }

  _updateServiceItem(int index, ServiceOrderItemModel newItem) {
    final newState = [...state];
    newState.replaceRange(index, index + 1, [newItem]);
    state = newState;
  }

  _handleEmployeeChanged(int index, EmployeeModel? employeeModel) {
    final item = state[index];
    _updateServiceItem(index, item.copyWith(employee: employeeModel));
  }

  handlePriceChanged(int index, double price) {
    final item = state[index];
    _updateServiceItem(index, item.copyWith(price: price));
  }

  handleSelectEmployee(int index) async {
    final value = await ref.read(goRouterProvider).push(Routes.app.serviceOrder.selectEmployee);
    if (value != null && value is EmployeeModel) {
      _handleEmployeeChanged(index, value);
    }
  }

  handleRemoveEmployee(int index) {
    final item = state[index];

    final newItem = ServiceOrderItemModel(
      serviceOrderItemId: item.serviceOrderItemId,
      service: item.service,
      price: item.price,
    );
    _updateServiceItem(index, newItem);
  }
}
