import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/models/create_vehicle_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/repositories/vehicle_repository.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/license_plate.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_id.dart';

part 'vehicle_form_page_controller.g.dart';

@riverpod
class VehicleFormPageController extends _$VehicleFormPageController {
  @override
  AsyncValue<Vehicle?> build(VehicleId arg) {
    if (arg != "new") {
      findById(arg);
    }

    return const AsyncValue.data(null);
  }

  Future<void> findById(VehicleId vehicleId) async {
    final getVehicleResult = await ref.read(vehicleRepositoryProvider).findById(vehicleId);

    state = switch (getVehicleResult) {
      Success(:final value) => AsyncValue.data(value),
      Failure(:final exception, :final stackTrace) => AsyncValue.error(exception, stackTrace)
    };
  }

  Future<void> saveOrUpdate({
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

    final saveVehicleResult = await ref.read(vehicleRepositoryProvider).saveOrUpdate(createVehicleModel);

    state = switch (saveVehicleResult) {
      Success(:final value) => AsyncValue.data(value),
      Failure(:final exception, :final stackTrace) => AsyncValue.error(exception, stackTrace)
    };

    showProgress.state = false;
  }

  Future<bool> existsByLicensePlate(String licensePlate) async {
    final existsResult = await ref.read(vehicleRepositoryProvider).existsByLicensePlate(
          licensePlate: licensePlate,
          updatingVehicleId: state.value?.vehicleId,
        );

    switch (existsResult) {
      case Success(:final value):
        return value;
      case Failure(:final exception, :final stackTrace):
        state = AsyncValue.error(exception, stackTrace);
        return false;
    }
    ;
  }
}
