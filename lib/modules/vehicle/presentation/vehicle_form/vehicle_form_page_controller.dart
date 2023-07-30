import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/repositories/vehicle_repository_provider.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_request_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_typedefs.dart';

class VehicleFormPageController extends AutoDisposeFamilyAsyncNotifier<VehicleModel?, VehicleId> {
  @override
  FutureOr<VehicleModel?> build(VehicleId arg) async {
    if (arg == "new") {
      return null;
    }
    final vehicle = await ref.read(vehicleRepositoryProvider).findById(arg);
    return vehicle;
  }

  Future<void> saveOrUpdate(
      {required String description, required LicensePlate licensePlate, String? modelYear}) async {
    final showProgress = ref.read(isLoadingProvider.notifier);
    showProgress.state = true;
    state = await AsyncValue.guard<VehicleModel?>(() async {
      final vehicleModel = VehicleRequestModel(
        vehicleId: state.value?.vehicleId,
        licensePlate: licensePlate,
        description: description,
        modelYear: modelYear,
      );

      if (vehicleModel.vehicleId != null) {
        return await ref.read(vehicleRepositoryProvider).update(vehicleModel);
      }

      return await ref.read(vehicleRepositoryProvider).save(vehicleModel);
    });
    showProgress.state = false;
  }

  Future<bool> existsByLicensePlate(String licensePlate) => ref.read(vehicleRepositoryProvider).existsByLicensePlate(
        licensePlate: licensePlate,
        updatingVehicleId: state.value?.vehicleId,
      );
}
