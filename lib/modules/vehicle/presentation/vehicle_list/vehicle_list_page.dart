import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/application/vehicle_service.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/vehicle_routes.dart';
import 'package:voleep_carclean_frontend/shared/enums/selection.dart';
import 'package:voleep_carclean_frontend/shared/utils/list_controller.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scaffold_with_list/scaffold_with_list.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_list_tile/voleep_list_tile.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_sliver_bar/voleep_sliver_bar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_sliver_search/voleep_sliver_search.dart';

class VehicleListPage extends ConsumerStatefulWidget {
  const VehicleListPage({super.key, this.selection = Selection.none});

  final Selection selection;

  @override
  ConsumerState<VehicleListPage> createState() => _VehicleListPageState();
}

class _VehicleListPageState extends ConsumerState<VehicleListPage> {
  late final ListController<VehicleModel> listController;

  @override
  void initState() {
    listController = ListController(
      selection: widget.selection,
      selectionKey: (item) => item.vehicleId,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithList(
      headerSlivers: [
        const VoleepSliverBar(
          title: "Veículos",
        ),
        VoleepSliverSearch(
          field: 'description',
          controller: listController,
        ),
      ],
      controller: listController,
      onSearch: ref.read(vehicleServiceProvider).getPage,
      itemBuilder: (context, index, item) {
        return VoleepListTile(
          title: item.description,
          subtitle:
              "Placa: ${item.licensePlate} - Ano: ${item.modelYear ?? 'não cadastrado'}",
          item: item,
          controller: listController,
          onEdit: goToUpdate,
        );
      },
      onDone: () => context.pop(listController.selected),
      onNew: goToNew,
    );
  }

  goToNew() async {
    context.push(VehicleRoutes.create);
  }

  goToUpdate(VehicleModel vehicle) async {
    context.push(VehicleRoutes.edit(vehicle.vehicleId));
  }

  @override
  void dispose() {
    listController.dispose();

    super.dispose();
  }
}
