import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_extension.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/dtos/create_vehicle_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/repositories/vehicle_repository.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/license_plate.dart';

part 'vehicle_edit_vm.g.dart';

@riverpod
class VehicleEditVm extends _$VehicleEditVm {
  bool get isNew => id == 'new';

  @override
  FutureOr<VehicleModel> build(String id) async {
    if (isNew) {
      return VehicleModel(
        vehicleId: const Uuid().v1(),
        licensePlate: '',
        description: '',
      );
    }

    final getResult = await ref.read(vehicleRepositoryProvider).findById(id);

    return switch (getResult) {
      Success(:final value) => value,
      Failure(:final exception) => throw Exception(exception.message)
    };
  }

  Future<void> save({
    required String description,
    required LicensePlate licensePlate,
    String? modelYear,
  }) async {
    final showProgress = ref.read(isLoadingProvider.notifier);
    showProgress.state = true;

    final createVehicleModel = CreateVehicleModel(
      vehicleId: state.value?.vehicleId,
      licensePlate: licensePlate,
      description: description,
      modelYear: modelYear,
    );

    final saveVehicleResult = await ref
        .read(vehicleRepositoryProvider)
        .save(createVehicleModel, isNew);

    state = switch (saveVehicleResult) {
      Success(:final value) => AsyncValue.data(value),
      Failure(:final exception, :final stackTrace) =>
        state.mergeWith(AsyncError(exception, stackTrace))
    };

    showProgress.state = false;
  }

  Future<Either<Exception, bool>> existsByPlate(String licensePlate) async {
    final existsResult =
        await ref.read(vehicleRepositoryProvider).existsByPlate(
              licensePlate: licensePlate,
              updatingVehicleId: state.value?.vehicleId,
            );

    switch (existsResult) {
      case Success():
        return existsResult;
      case Failure(:final exception, :final stackTrace):
        state = state.mergeWith(AsyncError(exception, stackTrace));
        return Failure(exception, stackTrace);
    }
  }
}
