import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_query_state.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_query.dart';

class FilterChipsView extends ConsumerWidget {
  const FilterChipsView({super.key, required this.config, required this.field, required this.onPressed});

  final SearchConfig config;
  final String field;
  final Function(FilterQueryState state) onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queryList = ref.watch(filterQueryProvider(config));

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 5),
      child: Wrap(
          runAlignment: WrapAlignment.start,
          spacing: 4,
          runSpacing: 4,
          alignment: WrapAlignment.start,
          children: queryList
                  ?.where((query) => query.field == field)
                  .map(
                    (query) => InputChip(
                      visualDensity: VisualDensity.compact,
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: BorderSide(color: Theme.of(context).colorScheme.primary),
                      label: Text(query.valueLabel),
                      onPressed: () => onPressed(query),
                      onDeleted: () => ref.read(filterQueryProvider(config).notifier).remove(query),
                    ),
                  )
                  .toList() ??
              []),
    );
  }
}
