import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/vehicle_edit/vehicle_edit_page.dart';

abstract class VehicleRoutes {
  static const list = '/veiculos';

  static String edit(String id) => '/veiculo/$id';
}

final vehicleRoutes = <GoRoute>[
  GoRoute(
    path: ":id",
    builder: (context, state) {
      final id = state.pathParameters['id'] ?? 'new';

      return VehicleEditPage(
        vehicleId: id,
      );
    },
  ),
];
