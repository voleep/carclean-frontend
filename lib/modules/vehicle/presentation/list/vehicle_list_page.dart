import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/enums/filter_type.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/action_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/column_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/carclean_search.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/search_controller.dart';
import 'package:voleep_carclean_frontend/shared/widgets/delete_bottom_sheet/delete_bottom_sheet.dart';

class VehicleListPage extends ConsumerWidget {
  VehicleListPage({super.key});

  final _searchConfig = SearchConfig(endpoint: "${ApiConfig.CARCLEAN_API_URL}/vehicle", orderField: "description", filterOnInit: true);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: CarCleanSearch<VehicleModel>(
          config: _searchConfig,
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
          columns: const [
            ColumnOption(title: "Veículo", width: 200),
            ColumnOption(title: "Placa", width: 500),
            ColumnOption(title: "Ano", width: 500),
          ],
          cellsBuilder: (context, index, item) {
            return [
              Text(item.description),
              Text(item.licensePlate),
              Text(item.modelYear ?? ""),
            ];
          },
          actionsBuilder: (_, index, item) => [
            ActionOption(
              title: "Editar",
              icon: Icons.edit_rounded,
              backgroundColor: Colors.greenAccent,
              foregroundColor: const Color.fromARGB(255, 11, 88, 13),
              onTap: () async {
                final shouldReload = await context.push(
                  Routes.app.vehicle.update(item.vehicleId ?? "new"),
                );
                if (shouldReload == true) {
                  ref.read(searchControllerProvider(_searchConfig).notifier).refresh();
                }
              },
            ),
            ActionOption(
              title: "Excluir",
              icon: Icons.delete_rounded,
              backgroundColor: Colors.redAccent,
              onTap: () async {
                final value = await showModalBottomSheet(
                  useRootNavigator: true,
                  context: context,
                  builder: (context) => const DeleteBottomSheet(),
                );
              },
            ),
          ],
          itemBuilder: (context, index, item) => ListTile(
            title: Text(item.description),
            subtitle: Text("${item.licensePlate} - ${item.modelYear}"),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: AlignmentDirectional.center,
                      color: Theme.of(context).colorScheme.surfaceTint.withOpacity(0.5),
                      child: Text(item.description.substring(0, 1).toUpperCase()),
                    )),
              ],
            ),
            trailing: const Icon(Icons.navigate_next_rounded),
            onTap: () async {
              final shouldReload = await context.push(
                Routes.app.vehicle.update(item.vehicleId ?? "new"),
              );
              if (shouldReload == true) {
                ref.read(searchControllerProvider(_searchConfig).notifier).refresh();
              }
            },
          ),
          fromJsonT: VehicleModel.fromJson,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_rounded),
          onPressed: () async {
            final shouldReload = await context.push(Routes.app.vehicle.create);
            if (shouldReload == true) {
              ref.read(searchControllerProvider(_searchConfig).notifier).refresh();
            }
          }),
    );
  }
}
