import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/models/service_model.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/enums/filter_type.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/column_option.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/carclean_search.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/search_controller.dart';

class ServiceSearchPage extends ConsumerStatefulWidget {
  const ServiceSearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServiceSearchPageState();
}

class _ServiceSearchPageState extends ConsumerState<ServiceSearchPage> {
  final _searchConfig = SearchConfig(
      endpoint: "${ApiConfig.CARCLEAN_API_URL}/service",
      orderField: "description",
      filterOnInit: true);
  final _searchFilter = const FilterOption(
      title: "Descrição", field: "description", type: FilterType.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CarCleanSearch<ServiceModel>(
          config: _searchConfig,
          searchBarFilter: _searchFilter,
          filterOptions: [
            const FilterOption(
              title: "Código",
              field: "code",
              type: FilterType.number,
            ),
            _searchFilter,
            const FilterOption(
              title: "Descrição completa",
              field: "fullDescription",
              type: FilterType.text,
            ),
            const FilterOption(
              title: "Valor",
              field: "price",
              type: FilterType.number,
            ),
          ],
          columns: const [
            ColumnOption(title: "Código", width: 50),
            ColumnOption(title: "Descrição", width: 700),
            ColumnOption(title: "Valor", width: 50),
          ],
          cellsBuilder: (context, index, item) {
            return [
              Text(item.code.toString()),
              Text(item.description),
              Text("R\$ ${item.price.toStringAsFixed(2)}"),
            ];
          },
          actionsBuilder: (_, index, item) => [],
          itemBuilder: (context, index, item) => ListTile(
            title: Text(item.description),
            subtitle: Text("R\$ ${item.price.toStringAsFixed(2)}"),
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
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceTint
                          .withOpacity(0.5),
                      child: Text(item.code.toString()),
                    )),
              ],
            ),
            trailing: const Icon(Icons.navigate_next_rounded),
            onTap: () async {
              final shouldReload = await context.push(
                Routes.app.service.update(item.serviceId),
              );
              if (shouldReload == true) {
                ref
                    .read(searchControllerProvider(_searchConfig).notifier)
                    .refreshByIndex(index);
              }
            },
          ),
          fromJsonT: ServiceModel.fromJson,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_rounded),
          onPressed: () async {
            final shouldReload = await context.push(Routes.app.service.create);
            if (shouldReload == true) {
              ref
                  .read(searchControllerProvider(_searchConfig).notifier)
                  .refresh();
            }
          }),
    );
  }
}
