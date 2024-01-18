import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/vehicle_edit/vehicle_edit_page.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/vehicle_list/vehicle_list_page.dart';
import 'package:voleep_carclean_frontend/shared/enums/selection.dart';

abstract class VehicleRoutes {
  static const list = '/veiculos';

  static const create = '/veiculo/new';

  static final singleSelection = '/veiculo/selecionar/${Selection.single.name}';

  static final multiSelection = '/veiculo/selecionar/${Selection.multi.name}';

  static String edit(String id) => '/veiculo/$id';
}

final vehicleRoutes = <GoRoute>[
  GoRoute(
    path: "selecionar/:selection",
    builder: (context, state) {
      final selection = state.pathParameters['selection']!;
      return VehicleListPage(
        selection: Selection.values.byName(selection),
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
