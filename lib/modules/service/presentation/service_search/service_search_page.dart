import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/modules/service/data/models/service_model.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/enums/selection_mode.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/enums/filter_type.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/fab_option.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/carclean_search.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/search_controller.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_search_tile/voleep_search_tile.dart';

class ServiceSearchPage extends ConsumerStatefulWidget {
  const ServiceSearchPage({super.key, this.selectionMode = SelectionMode.none});

  final SelectionMode selectionMode;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ServiceSearchPageState();
}

class _ServiceSearchPageState extends ConsumerState<ServiceSearchPage> {
  late SearchConfig searchConfig;
  final searchFilter = const FilterOption(title: "Descrição", field: "description", type: FilterType.text);

  @override
  void initState() {
    searchConfig = SearchConfig(
      endpoint: "${ApiConfig.CARCLEAN_API_URL}/service",
      orderField: "description",
      filterOnInit: true,
      selectionMode: widget.selectionMode,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    handleGoToUpdate(ServiceModel item, int index) async {
      final shouldReload = await context.push(
        Routes.app.service.update(item.serviceId),
      );
      if (shouldReload == true) {
        ref.read(searchControllerProvider(searchConfig).notifier).refreshByIndex(index);
      }
    }

    return CarCleanSearch<ServiceModel, ServiceId>(
      config: searchConfig,
      selectId: (item) => item.serviceId,
      searchBarFilter: searchFilter,
      filterOptions: [
        const FilterOption(
          title: "Código",
          field: "code",
          type: FilterType.number,
        ),
        searchFilter,
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
      itemBuilder: (context, index, item, isSelected) => VoleepSearchTile(
        selected: isSelected,
        title: item.description,
        subtitle: "${item.fullDescription}\nValor: R\$ ${item.price.toStringAsFixed(2)}",
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isSelected
                  ? ClipRRect(
                      key: ValueKey<int>(index),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: Container(
                        width: 40,
                        height: 40,
                        alignment: AlignmentDirectional.center,
                        color: Theme.of(context).colorScheme.surfaceTint,
                        child: Icon(
                          Icons.check_rounded,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    )
                  : ClipRRect(
                      key: ValueKey<int>(index + 1),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: Container(
                        width: 40,
                        height: 40,
                        alignment: AlignmentDirectional.center,
                        color: Theme.of(context).colorScheme.surfaceTint.withOpacity(0.5),
                        child: Text(item.code.toString()),
                      ),
                    ),
            )
          ],
        ),
        trailing: IconButton(
          visualDensity: VisualDensity.compact,
          onPressed: () => handleGoToUpdate(item, index),
          icon: const Icon(Icons.navigate_next_rounded),
        ),
      ),
      fromJsonT: ServiceModel.fromJson,
      onTapItem: handleGoToUpdate,
      onSelectItems: (items) => context.pop(items),
      fabOption: FabOption(
        child: const Icon(Icons.add_rounded),
        onPressed: () async {
          final shouldReload = await context.push(Routes.app.service.create);
          if (shouldReload == true) {
            ref.read(searchControllerProvider(searchConfig).notifier).refresh();
          }
        },
      ),
    );
  }
}
