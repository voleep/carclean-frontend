import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/service/data/models/create_service_model.dart';
import 'package:voleep_carclean_frontend/modules/service/data/repositories/service_repository.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/entities/service.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';

part 'service_form_controller.g.dart';

@riverpod
class ServiceFormController extends _$ServiceFormController {
  @override
  AsyncValue<Service?> build(ServiceId? arg, FormMode mode) {
    if (arg != null) {
      findById(arg);
    }
    return const AsyncValue.data(null);
  }

  Future<void> findById(ServiceId serviceId) async {
    final getServiceResult = await ref.read(serviceRepositoryProvider).findById(serviceId);

    state = switch (getServiceResult) {
      Success(:final value) => AsyncValue.data(value),
      Failure(:final exception, :final stackTrace) => AsyncValue.error(exception, stackTrace)
    };
  }

  Future<void> saveOrUpdate({
    required String description,
    required String fullDescription,
    required double price,
    required double pcCommission,
  }) async {
    final showProgress = ref.read(isLoadingProvider.notifier);
    showProgress.state = true;

    final createServiceModel = CreateServiceModel(
      serviceId: mode == FormMode.update ? state.value?.serviceId : null,
      description: description,
      fullDescription: fullDescription,
      price: price,
      pcCommission: pcCommission,
    );

    final saveServiceResult = await ref.read(serviceRepositoryProvider).saveOrUpdate(createServiceModel);

    state = switch (saveServiceResult) {
      Success(:final value) => AsyncValue.data(value),
      Failure(:final exception, :final stackTrace) => AsyncValue.error(exception, stackTrace)
    };

    showProgress.state = false;
  }
}
