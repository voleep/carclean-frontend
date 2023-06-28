import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/enums/filter_type.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_date_view.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_text_view.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_enum_view.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/providers/opened_expansion_panel_index_providier.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter_header/filter_header.dart';

class FilterView extends ConsumerWidget {
  const FilterView({super.key, required this.config, required this.filterOptions});

  final SearchConfig config;
  final List<FilterOption> filterOptions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openedIndex = ref.watch(openedExpansionPanelIndexProvider);

    return Consumer(
      builder: (context, ref, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: 350,
            child: Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.background,
              child: Column(
                children: [
                  FilterHeader(config: config),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpansionPanelList(
                        dividerColor: Colors.transparent,
                        elevation: 0,
                        animationDuration: const Duration(milliseconds: 400),
                        expansionCallback: (panelIndex, isExpanded) =>
                            ref.read(openedExpansionPanelIndexProvider.notifier).state = !isExpanded ? panelIndex : -1,
                        children: filterOptions.asMap().entries.map((filterEntry) {
                          final isExpanded = filterEntry.key == openedIndex;
                          return ExpansionPanel(
                              canTapOnHeader: true,
                              isExpanded: isExpanded,
                              backgroundColor: isExpanded ? Theme.of(context).colorScheme.primaryContainer.withAlpha(100) : null,
                              headerBuilder: (context, isExpanded) {
                                return Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(left: 18),
                                  child: Text(
                                    filterEntry.value.title,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                );
                              },
                              body: LayoutBuilder(
                                builder: (context, constraints) {
                                  if (filterEntry.value.type == FilterType.text) {
                                    return FilterTextView(
                                      config: config,
                                      filterOption: filterEntry.value,
                                    );
                                  }

                                  if (filterEntry.value.type == FilterType.enumeration) {
                                    return FilterEnumView(
                                      config: config,
                                      filterOption: filterEntry.value,
                                    );
                                  }

                                  if (filterEntry.value.type == FilterType.date) {
                                    return FilterDateView(
                                      config: config,
                                      filterOption: filterEntry.value,
                                    );
                                  }

                                  return const SizedBox.shrink();
                                },
                              ));
                        }).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, right: 24, bottom: 12, left: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        TextButton(
                          onPressed: () => context.pop(),
                          child: Text(
                            "FECHAR",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onSurfaceVariant),
                          ),
                        ),
                        const SizedBox(width: 12),
                        TextButton(
                          onPressed: () => context.pop(true),
                          child: Text(
                            "FILTRAR",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
