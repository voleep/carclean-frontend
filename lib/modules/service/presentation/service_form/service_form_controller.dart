import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/service/application/dtos/service_request_dto.dart';
import 'package:voleep_carclean_frontend/modules/service/application/services/service_service.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/models/service_model.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';

part 'service_form_controller.g.dart';

@riverpod
class ServiceFormController extends _$ServiceFormController {
  @override
  FutureOr<ServiceModel?> build(ServiceId? arg, FormMode mode) async {
    if (arg != null) {
      return await ref.read(serviceServiceProvider).findById(arg);
    }
    return null;
  }

  Future<void> saveOrUpdate({
    required String description,
    required String fullDescription,
    required double price,
    required double pcCommission,
  }) async {
    final showProgress = ref.read(isLoadingProvider.notifier);
    showProgress.state = true;
    state = await AsyncValue.guard<ServiceModel?>(() async {
      final serviceRequestDTO = ServiceRequestDTO(
        serviceId: mode == FormMode.update ? state.value?.serviceId : null,
        description: description,
        fullDescription: fullDescription,
        price: price,
        pcCommission: pcCommission,
      );

      final service = ref.read(serviceServiceProvider);

      if (serviceRequestDTO.serviceId != null) {
        return await service.update(serviceRequestDTO);
      }

      return await service.save(serviceRequestDTO);
    });
    showProgress.state = false;
  }
}
