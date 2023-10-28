import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/typedefs/service_order_typedefs.dart';

part 'service_order_form_controller.g.dart';

@riverpod
class ServiceOrderFormController extends _$ServiceOrderFormController {
  @override
  ServiceOrderModel? build(ServiceOrderId? serviceOrderId) {
    return null;
  }
}
