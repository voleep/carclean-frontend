import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/routing/menus/selected_menu.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/enums/filter_type.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/column_option.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/fab_option.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/typedefs/cells_builder.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/typedefs/item_builder.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/typedefs/actions_builder.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/typedefs/from_json_t.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/carclean_search_mobile.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/data_table/data_pagination_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/data_table/data_table_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/data_table/selected_row_actions.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/data_table/selected_row_index.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/filter/filter_query.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/filter/filter_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/search_controller.dart';
import 'package:side_sheet/side_sheet.dart';

class CarCleanSearch<T, I> extends ConsumerWidget {
  CarCleanSearch({
    super.key,
    required this.config,
    required this.selectId,
    required this.searchBarFilter,
    required this.filterOptions,
    this.fabOption,
    required this.columns,
    required this.actionsBuilder,
    required this.itemBuilder,
    required this.cellsBuilder,
    required this.fromJsonT,
    this.onTapItem,
    this.onSelectItems,
  }) : assert(searchBarFilter.type == FilterType.text);

  final SearchConfig config;
  final I Function(T item) selectId;
  final FilterOption searchBarFilter;
  final List<FilterOption> filterOptions;
  final FabOption? fabOption;
  final List<ColumnOption> columns;
  final ItemBuilder<T> itemBuilder;
  final CellsBuilder<T> cellsBuilder;
  final ActionsBuilder<T> actionsBuilder;
  final FromJsonT<T> fromJsonT;
  final void Function(T item, int index)? onTapItem;
  final void Function(List<T> items)? onSelectItems;

  final _dataTableKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMenu = ref.read(selectedMenuProvider);
    final isMobile = Responsive.isMobile(context);

    return isMobile
        ? CarCleanSearchMobile<T, I>(
            config: config,
            selectId: selectId,
            searchBarFilter: searchBarFilter,
            filterOptions: filterOptions,
            fabOption: fabOption,
            columns: columns,
            actionsBuilder: actionsBuilder,
            itemBuilder: itemBuilder,
            fromJsonT: fromJsonT,
            onTapItem: onTapItem,
            onSelectItems: onSelectItems,
          )
        : Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Consumer(
                  builder: (context, ref, child) {
                    final queryList = ref.watch(filterQueryProvider(config));

                    return Wrap(
                      alignment: WrapAlignment.start,
                      children: queryList
                              ?.map(
                                (query) => InputChip(
                                  label: Text(query.formattedLabel()),
                                  onPressed: () {},
                                  onDeleted: () => ref.read(filterQueryProvider(config).notifier).remove(query),
                                ),
                              )
                              .toList() ??
                          [],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 90,
                width: double.infinity,
                child: Card(
                  elevation: 0,
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      ElevatedButton(
                          onPressed: () async {
                            final value = isMobile
                                ? showDialog(
                                    context: context,
                                    builder: (context) => FilterView(config: config, filterOptions: filterOptions),
                                  )
                                : await SideSheet.right(
                                    context: context,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    sheetColor: Colors.transparent,
                                    body: FilterView(config: config, filterOptions: filterOptions),
                                  );

                            if (value == true) {
                              final queryList = ref.read(filterQueryProvider(config));
                              ref.read(searchControllerProvider(config).notifier).search(queryList ?? []);
                            }
                          },
                          child: const Text("Filtros")),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Card(
                elevation: 0,
                margin: const EdgeInsets.only(top: 12),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                        child: Row(
                          children: [
                            Text(
                              selectedMenu.label,
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            Consumer(
                              builder: (context, ref, child) {
                                final actions = ref.watch(selectedRowActionsProvider(_dataTableKey));

                                if (actions == null) {
                                  return const SizedBox.shrink();
                                }

                                return Visibility(
                                  child: Row(
                                    children: actions
                                        .map((action) => IconButton(onPressed: action.onTap, icon: Icon(action.icon)))
                                        .toList(),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      endIndent: 0,
                    ),
                    Expanded(
                      child: Consumer(
                        builder: (context, ref, child) {
                          final controller = ref.watch(searchControllerProvider(config));

                          return controller.when(
                            error: (error, stackTrace) {
                              Clipboard.setData(ClipboardData(text: "$error \n$stackTrace"));
                              return Center(
                                  child: SingleChildScrollView(
                                child: Text("$error \n$stackTrace"),
                              ));
                            },
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            data: (data) {
                              if (data == null || data.pageData.isEmpty) {
                                return const Center(
                                  child: Text("Sem resultados"),
                                );
                              }

                              final itemList = data.pageData.map((json) => fromJsonT(json)).toList();

                              if (isMobile) {
                                return ListView.separated(
                                  itemCount: itemList.length,
                                  itemBuilder: (context, index) {
                                    final currentItem = itemList[index];
                                    return itemBuilder(context, index, currentItem, false);
                                  },
                                  separatorBuilder: (context, index) => const Divider(),
                                );
                              }

                              return Padding(
                                padding: const EdgeInsets.only(right: 24, bottom: 12, left: 24),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: LayoutBuilder(
                                        builder: (context, constraints) {
                                          return DataTableView<T>(
                                            key: _dataTableKey,
                                            data: itemList,
                                            columns: columns,
                                            cellsBuilder: cellsBuilder,
                                            actionsBuilder: actionsBuilder,
                                            tableHeight: constraints.maxHeight,
                                          );
                                        },
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      thickness: 2,
                                      color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.5),
                                    ),
                                    const SizedBox(height: 8),
                                    DataPaginationView(
                                      pageData: data,
                                      onPageChanged: (page) {
                                        final queryList = ref.read(filterQueryProvider(config));
                                        ref.read(selectedRowIndexProvider(_dataTableKey).notifier).unselect();
                                        ref.read(selectedRowActionsProvider(_dataTableKey).notifier).unselect();
                                        ref
                                            .read(searchControllerProvider(config).notifier)
                                            .search(queryList ?? [], page);
                                      },
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )),
            ],
          );
  }
}
