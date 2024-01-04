import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/config/api_config.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_id.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/vehicle_routes.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/enums/filter_type.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/carclean_search.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/search_controller.dart';

class VehicleListPage extends ConsumerWidget {
  VehicleListPage({super.key, this.selectionMode = false});

  final bool selectionMode;

  final _searchConfig = SearchConfig(
      endpoint: "${ApiConfig.CARCLEAN_API_URL}/vehicle",
      orderField: "description",
      filterOnInit: true);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        CarCleanSearch<VehicleModel, VehicleId>(
          config: _searchConfig,
          selectId: (item) => item.vehicleId,
          searchBarFilter: const FilterOption(
            title: "Veículo",
            field: "description",
            type: FilterType.text,
          ),
          filterOptions: const [
            FilterOption(
              title: "Veículo",
              field: "description",
              type: FilterType.text,
            ),
            FilterOption(
              title: "Placa",
              field: "licensePlate",
              type: FilterType.text,
            ),
            FilterOption(
              title: "Ano",
              field: "modelYear",
              type: FilterType.text,
            ),
          ],
          itemBuilder: (context, index, item, selected) => ListTile(
            title: Text(item.description),
            subtitle: Text(
                "Placa: ${item.licensePlate} ${item.modelYear != null ? '- Ano: ${item.modelYear}' : ''}"),
            trailing: const Icon(Icons.navigate_next_rounded),
            onTap: () async {
              if (selectionMode) {
                return context.pop(item);
              }
              final shouldReload = await context.push(
                VehicleRoutes.edit(item.vehicleId),
              );
              if (shouldReload == true) {
                ref
                    .read(searchControllerProvider(_searchConfig).notifier)
                    .refreshByIndex(index);
              }
            },
          ),
          fromJsonT: VehicleModel.fromJson,
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: FloatingActionButton(
              child: const Icon(Icons.add_rounded),
              onPressed: () async {
                final shouldReload = await context.push(VehicleRoutes.create);
                if (shouldReload == true) {
                  ref
                      .read(searchControllerProvider(_searchConfig).notifier)
                      .refresh();
                }
              }),
        ),
      ],
    );
  }
}
