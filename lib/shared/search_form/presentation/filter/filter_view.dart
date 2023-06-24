import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/enums/filter_type.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_query_state.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_query.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_date_view.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_text_view.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_enum_view.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter_card/filter_card.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter_header/filter_header.dart';

class FilterView extends ConsumerWidget {
  const FilterView({super.key, required this.config, required this.filterOptions});

  final SearchConfig config;
  final List<FilterOption> filterOptions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  const FilterHeader(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: filterOptions.map((filter) {
                          if (filter.type == FilterType.text) {
                            return FilterCard(
                              title: Row(
                                children: [
                                  Expanded(child: Text(filter.title)),
                                  const SizedBox(
                                    width: 220,
                                    child: Text("Condição"),
                                  )
                                ],
                              ),
                              child: FilterTextView(
                                config: config,
                                filterOption: filter,
                              ),
                            );
                          }

                          if (filter.type == FilterType.enumeration) {
                            return FilterCard(title: Text(filter.title), child: FilterEnumView(config: config, filterOption: filter));
                          }

                          if (filter.type == FilterType.date) {
                            return FilterCard(
                                title: Text(filter.title),
                                child: FilterDateView(
                                  config: config,
                                  filterOption: filter,
                                ));
                          }

                          return const SizedBox.shrink();
                        }).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      children: [
                        FilledButton(
                          onPressed: () => context.pop(true),
                          child: const Text("Filtrar"),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        FilledButton.tonal(
                          onPressed: () => context.pop(),
                          child: const Text("Fechar"),
                        ),
                        const Spacer(),
                        FilledButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith((states) => Theme.of(context).colorScheme.error.withOpacity(0.8))),
                            onPressed: () => ref.read(filterQueryProvider(config).notifier).clear(),
                            child: const Text("Limpar")),
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
