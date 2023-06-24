import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_typedefs.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/vehicle-form/vehicle_form_page_controller.dart';

final vehicleFormPageControllerProvider =
    AutoDisposeAsyncNotifierProviderFamily<VehicleFormPageController,
        VehicleModel?, VehicleId?>(() => VehicleFormPageController());
