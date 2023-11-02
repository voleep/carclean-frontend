import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/enums/filter_condition.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/enums/filter_type.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/filter_query_state.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/filter/filter_query.dart';

class FilterEnumView extends ConsumerWidget {
  FilterEnumView({
    super.key,
    required this.config,
    required this.filterOption,
  }) : assert(
          filterOption.type == FilterType.enumeration && filterOption.enumOptions != null,
        );

  final SearchConfig config;
  final FilterOption filterOption;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queryEnumList = ref.watch(filterQueryProvider(config)
        .select((value) => value?.where((element) => element.field == filterOption.field).toList() ?? []));

    return Column(
      children: filterOption.enumOptions!.asMap().entries.map((optionEntry) {
        final filterEnum = optionEntry.value;
        final isChecked = queryEnumList.any((element) => element.value == filterEnum.value);

        return CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: const EdgeInsets.only(left: 8),
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Theme.of(context).colorScheme.primary;
            }

            return Theme.of(context).colorScheme.outline;
          }),
          value: isChecked,
          title: Text(
            filterEnum.title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
          onChanged: (value) {
            if (value == true) {
              ref.read(filterQueryProvider(config).notifier).add(
                    FilterQueryState(
                      title: filterOption.title,
                      field: filterOption.field,
                      operator: FilterCondition.equals,
                      valueLabel: filterEnum.title,
                      value: filterEnum.value,
                    ),
                  );
            } else {
              final query = queryEnumList.firstWhere((element) => element.value == filterEnum.value);
              ref.read(filterQueryProvider(config).notifier).remove(query);
            }
          },
        );
      }).toList(),
    );
  }
}
