import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/enums/filter_condition.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/column_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_query_state.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/typedefs/item_builder.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/typedefs/actions_builder.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/typedefs/from_json_t.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_query.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_view.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/search_controller.dart' as search_controller;
import 'package:voleep_carclean_frontend/shared/utils/debounce_time.dart';

class CarCleanSearchMobile<T> extends ConsumerWidget {
  CarCleanSearchMobile({
    super.key,
    required this.config,
    required this.searchBarFilter,
    required this.filterOptions,
    required this.columns,
    required this.actionsBuilder,
    required this.itemBuilder,
    required this.fromJsonT,
  });

  final SearchConfig config;
  final FilterOption searchBarFilter;
  final List<FilterOption> filterOptions;
  final List<ColumnOption> columns;
  final ItemBuilder<T> itemBuilder;
  final ActionsBuilder<T> actionsBuilder;
  final FromJsonT<T> fromJsonT;

  final _debounceTime = DebounceTime(milliseconds: 500);

  _performSearch(final String value, final WidgetRef ref) {
    final queryList = [...ref.read(filterQueryProvider(config)) ?? <FilterQueryState>[]];

    if (value.isNotEmpty) {
      queryList.add(FilterQueryState(
        title: searchBarFilter.title,
        field: searchBarFilter.field,
        operator: FilterCondition.includes,
        valueLabel: searchBarFilter.title,
        value: value,
      ));
    }

    ref.read(search_controller.searchControllerProvider(config).notifier).search(queryList);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(search_controller.searchControllerProvider(config));

    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              elevation: 0,
              toolbarHeight: 55,
              title: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: Center(
                        child: TextField(
                          textInputAction: TextInputAction.search,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Pesquisar',
                            prefixIcon: Icon(Icons.search),
                          ),
                          onChanged: (value) => _debounceTime.run(
                            () => _performSearch(value, ref),
                          ),
                          onSubmitted: (value) => _performSearch(value, ref),
                          onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                          onEditingComplete: () => FocusManager.instance.primaryFocus?.unfocus(),
                        ),
                      ),
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final queryList = ref.watch(filterQueryProvider(config));
                      final hasFilter = queryList != null && queryList.isNotEmpty;

                      return Badge(
                        isLabelVisible: hasFilter,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        label: hasFilter ? Text("${queryList.length}") : null,
                        offset: const Offset(-3, 3),
                        child: IconButton(
                          onPressed: () async {
                            final value = await showDialog(
                              context: context,
                              builder: (context) => FilterView(config: config, filterOptions: filterOptions),
                            );

                            if (value == true) {
                              final queryList = ref.read(filterQueryProvider(config));
                              ref.read(search_controller.searchControllerProvider(config).notifier).search(queryList ?? []);
                            }
                          },
                          icon: const Icon(Icons.filter_list_rounded),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ];
        },
        body: controller.when(
          error: (error, stackTrace) => Center(child: Text("$error")),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          data: (data) {
            if (data == null) {
              return const Center(
                child: Text("Sem resultados"),
              );
            }

            final itemList = data.pageData.map((json) => fromJsonT(json)).toList();

            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                final currentItem = itemList[index];
                return Slidable(
                    endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: actionsBuilder(context, index, currentItem)
                            .map(
                              (action) => SlidableAction(
                                onPressed: (context) => action.onTap(),
                                icon: action.icon,
                                foregroundColor: action.foregroundColor,
                                backgroundColor: action.backgroundColor,
                              ),
                            )
                            .toList()),
                    child: itemBuilder(context, index, currentItem));
              },
            );
          },
        ));
  }
}
