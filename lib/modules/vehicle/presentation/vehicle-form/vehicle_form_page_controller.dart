import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/dtos/create_vehicle_dto.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/dtos/update_vehicle_dto.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/repositories/vehicle_repository_provider.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_typedefs.dart';

class VehicleFormPageController
    extends AutoDisposeFamilyAsyncNotifier<VehicleModel?, VehicleId> {
  @override
  FutureOr<VehicleModel?> build(VehicleId arg) async {
    await Future.delayed(Duration(seconds: 2));
    if (arg == "new") {
      return null;
    }

    final vehicle = await ref.read(vehicleRepositoryProvider).findById(arg);

    return vehicle;
  }

  Future<void> saveOrUpdate(
      {required String? description,
      required LicensePlate licensePlate}) async {
    state = await AsyncValue.guard<VehicleModel?>(() async {
      if (state.value?.vehicleId == null) {
        final createVehicleDTO = CreateVehicleDTO(
          licensePlate: licensePlate,
          description: description,
        );

        return await ref.read(vehicleRepositoryProvider).save(createVehicleDTO);
      }

      final updateVehicleDTO = UpdateVehicleDTO(
        vehicleId: state.value!.vehicleId,
        licensePlate: licensePlate,
        description: description,
      );

      return await ref.read(vehicleRepositoryProvider).update(updateVehicleDTO);
    });
  }
}
