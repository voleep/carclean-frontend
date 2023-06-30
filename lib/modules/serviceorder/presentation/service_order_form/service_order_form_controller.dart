import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/serviceorder/application/dtos/service_order_request_dto.dart';
import 'package:voleep_carclean_frontend/modules/serviceorder/application/services/service_order_service.dart';
import 'package:voleep_carclean_frontend/modules/serviceorder/domain/models/service_order_model.dart';
import 'package:voleep_carclean_frontend/modules/serviceorder/domain/typedefs/service_order_types.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';

part 'service_order_form_controller.g.dart';

@riverpod
class ServiceOrderFormController extends _$ServiceOrderFormController {
  @override
  FutureOr<ServiceOrderModel?> build(ServiceOrderId? arg, FormMode mode) async {
    if (arg != null) {
      return await ref.read(serviceOrderServiceProvider).findById(arg);
    }
    return null;
  }

  Future<void> saveOrUpdate({required String description, required String fullDescription, required double price}) async {
    final showProgress = ref.read(isLoadingProvider.notifier);
    showProgress.state = true;
    state = await AsyncValue.guard<ServiceOrderModel?>(() async {
      final serviceOrderRequestDTO = ServiceOrderRequestDTO(
        serviceOrderId: mode == FormMode.update ? state.value?.serviceOrderId : null,
        description: description,
        fullDescription: fullDescription,
        price: price,
      );

      final service = ref.read(serviceOrderServiceProvider);

      if (serviceOrderRequestDTO.serviceOrderId != null) {
        return await service.update(serviceOrderRequestDTO);
      }

      return await service.save(serviceOrderRequestDTO);
    });
    showProgress.state = false;
  }
}
