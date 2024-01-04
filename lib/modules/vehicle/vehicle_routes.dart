import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/vehicle_edit/vehicle_edit_page.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/vehicle_list/vehicle_list_page.dart';
import 'package:voleep_carclean_frontend/shared/enums/selection.dart';

abstract class VehicleRoutes {
  static const list = '/veiculos';

  static const create = '/veiculo/new';

  static String select(Selection selection) =>
      '/veiculo/selecionar/${selection.name}';

  static String edit(String id) => '/veiculo/$id';
}

final vehicleRoutes = <GoRoute>[
  GoRoute(
    path: "selecionar/:selection",
    builder: (context, state) {
      return VehicleListPage(
        selectionMode: true,
      );
    },
  ),
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
