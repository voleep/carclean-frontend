import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/enums/filter_condition.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/column_option.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/filter_query_state.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/typedefs/item_builder.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/typedefs/actions_builder.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/typedefs/from_json_t.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/filter/filter_query.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/filter/filter_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/search_controller.dart'
    as search_controller;
import 'package:voleep_carclean_frontend/shared/utils/debounce_time.dart';
import 'package:voleep_carclean_frontend/shared/widgets/error_view/error_view.dart';

final loadindNextPageState = AutoDisposeStateProvider<bool>((ref) => false);

class CarCleanSearchMobile<T> extends ConsumerStatefulWidget {
  const CarCleanSearchMobile({
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

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CarCleanSearchMobileState<T>();
}

class _CarCleanSearchMobileState<T>
    extends ConsumerState<CarCleanSearchMobile<T>> {
  final _debounceTime = DebounceTime(milliseconds: 500);

  _performSearch(final String value, final WidgetRef ref) {
    final queryList = [
      ...ref.read(filterQueryProvider(widget.config)) ?? <FilterQueryState>[]
    ];

    if (value.isNotEmpty) {
      queryList.add(FilterQueryState(
        title: widget.searchBarFilter.title,
        field: widget.searchBarFilter.field,
        operator: FilterCondition.includes,
        valueLabel: widget.searchBarFilter.title,
        value: value,
      ));
    }

    ref
        .read(
            search_controller.searchControllerProvider(widget.config).notifier)
        .search(queryList);
  }

  _onScrollNotification(ScrollEndNotification scrollEndNotification) async {
    if (scrollEndNotification.metrics.pixels > 0 &&
        scrollEndNotification.metrics.atEdge) {
      ref.read(loadindNextPageState.notifier).state = true;
      await ref
          .read(search_controller
              .searchControllerProvider(widget.config)
              .notifier)
          .nextPage();
      ref.read(loadindNextPageState.notifier).state = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller =
        ref.watch(search_controller.searchControllerProvider(widget.config));

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverAppBar(
              floating: true,
              snap: true,
              elevation: 0,
              titleSpacing: 0,
              leadingWidth: 30,
              backgroundColor: Theme.of(context).colorScheme.background,
              title: Row(
                children: [
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.08),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          iconColor: Colors.black87,
                          border: InputBorder.none,
                          hintText: 'Pesquisar',
                          prefixIcon: Icon(Icons.search),
                        ),
                        onChanged: (value) => _debounceTime.run(
                          () => _performSearch(value, ref),
                        ),
                        onSubmitted: (value) => _performSearch(value, ref),
                        onTapOutside: (event) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        onEditingComplete: () =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                      ),
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final queryList =
                          ref.watch(filterQueryProvider(widget.config));
                      final hasFilter =
                          queryList != null && queryList.isNotEmpty;

                      return Badge(
                        isLabelVisible: hasFilter,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        label: hasFilter ? Text("${queryList.length}") : null,
                        offset: const Offset(-3, 3),
                        child: IconButton(
                          onPressed: () async {
                            final value = await showDialog(
                                context: context,
                                builder: (context) => FilterView(
                                    config: widget.config,
                                    filterOptions: widget.filterOptions));

                            if (value == true) {
                              final queryList =
                                  ref.read(filterQueryProvider(widget.config));
                              ref
                                  .read(search_controller
                                      .searchControllerProvider(widget.config)
                                      .notifier)
                                  .search(queryList ?? []);
                            }
                          },
                          icon: const Icon(Icons.tune_rounded),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      body: controller.when(
        error: (error, stackTrace) => ErrorView(
          error: error,
          stackTrace: stackTrace,
          onTryAgain: () => ref
              .read(search_controller
                  .searchControllerProvider(widget.config)
                  .notifier)
              .reload(),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (data) {
          if (data == null) {
            return const Center(
              child: Text("Sem resultados"),
            );
          }

          final itemList =
              data.pageData.map((json) => widget.fromJsonT(json)).toList();

          return Column(
            children: [
              Expanded(
                child: Scrollbar(
                  child: NotificationListener<ScrollEndNotification>(
                    onNotification: (scrollEndNotification) {
                      _onScrollNotification(scrollEndNotification);
                      return true;
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: itemList.length,
                      itemBuilder: (context, index) {
                        final currentItem = itemList[index];
                        return Slidable(
                            endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: widget
                                    .actionsBuilder(context, index, currentItem)
                                    .map(
                                      (action) => SlidableAction(
                                        onPressed: (context) => action.onTap(),
                                        icon: action.icon,
                                        foregroundColor: action.foregroundColor,
                                        backgroundColor: action.backgroundColor,
                                      ),
                                    )
                                    .toList()),
                            child: widget.itemBuilder(
                                context, index, currentItem));
                      },
                    ),
                  ),
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final isLoadingNextPage = ref.watch(loadindNextPageState);
                  if (isLoadingNextPage) {
                    return const LinearProgressIndicator(minHeight: 0.5);
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          );
        },
      ),
    );
  }
}
