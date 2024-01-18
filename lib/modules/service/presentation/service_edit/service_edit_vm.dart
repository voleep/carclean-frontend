import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/service/data/dtos/create_service_model.dart';
import 'package:voleep_carclean_frontend/modules/service/data/repositories/service_repository.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/entities/service_model.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';

part 'service_edit_vm.g.dart';

@riverpod
class ServiceEditVm extends _$ServiceEditVm {
  bool get isNew => id == 'new';

  @override
  FutureOr<ServiceModel> build(ServiceId id) async {
    if (isNew) {
      return ServiceModel(
        serviceId: const Uuid().v1(),
        code: 0,
        description: '',
        fullDescription: '',
        price: 0,
        pcCommission: 0,
      );
    }

    final getResult = await ref.read(serviceRepositoryProvider).findById(id);

    return switch (getResult) {
      Success(:final value) => value,
      Failure(:final exception) => throw exception
    };
  }

  Future<void> save({
    required String description,
    required String fullDescription,
    required double price,
    required double pcCommission,
  }) async {
    final showProgress = ref.read(isLoadingProvider.notifier);
    showProgress.state = true;

    final createServiceModel = CreateServiceModel(
      serviceId: state.value?.serviceId,
      description: description,
      fullDescription: fullDescription,
      price: price,
      pcCommission: pcCommission,
    );

    final saveServiceResult = await ref
        .read(serviceRepositoryProvider)
        .save(createServiceModel, isNew);

    state = switch (saveServiceResult) {
      Success(:final value) => AsyncValue.data(value),
      Failure(:final exception, :final stackTrace) =>
        state.mergeWith(AsyncError(exception, stackTrace))
    };

    showProgress.state = false;
  }
}
