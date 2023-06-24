import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/enums/filter_condition.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/enums/filter_type.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/enum_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_query_state.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_enum_condition_provider.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_enum_value_provider.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_query.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter_chips_view/filter_chips_view.dart';

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
    final selectedEnum = ref.watch(filterEnumValueProvider(config));
    final condition = ref.watch(filterEnumConditionProvider(config));

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DropdownMenu<EnumOption?>(
                width: 300,
                initialSelection: selectedEnum,
                inputDecorationTheme: const InputDecorationTheme(filled: true),
                dropdownMenuEntries: [
                  ...filterOption.enumOptions!.map((option) => DropdownMenuEntry<EnumOption>(label: option.title, value: option)).toList()
                ],
                onSelected: (value) {
                  ref.read(filterEnumValueProvider(config).notifier).value = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: DropdownMenu<FilterCondition>(
                width: 140,
                initialSelection: condition,
                inputDecorationTheme: const InputDecorationTheme(filled: true),
                dropdownMenuEntries: [
                  DropdownMenuEntry<FilterCondition>(label: FilterCondition.equals.label(), value: FilterCondition.equals),
                  DropdownMenuEntry<FilterCondition>(label: FilterCondition.notEquals.label(), value: FilterCondition.notEquals),
                ],
                onSelected: (value) {
                  ref.read(filterEnumConditionProvider(config).notifier).value = value ?? FilterCondition.equals;
                },
              ),
            ),
            Tooltip(
              message: "Adicionar",
              verticalOffset: 35,
              waitDuration: const Duration(seconds: 1),
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondaryContainer),
                  iconColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.onSurface),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  fixedSize: const MaterialStatePropertyAll(
                    Size(40, 40),
                  ),
                ),
                onPressed: () {
                  if (selectedEnum == null) {
                    return;
                  }

                  ref.read(filterQueryProvider(config).notifier).add(FilterQueryState(
                      title: filterOption.title,
                      field: filterOption.field,
                      operator: condition,
                      valueLabel: selectedEnum.title,
                      value: selectedEnum.value));
                },
                child: const Icon(Icons.add_rounded),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        FilterChipsView(
          config: config,
          field: filterOption.field,
          onPressed: (state) {
            ref.read(filterEnumValueProvider(config).notifier).value =
                filterOption.enumOptions!.firstWhere((element) => element.value == state.value);
            ref.read(filterEnumConditionProvider(config).notifier).value = state.operator;
            ref.read(filterQueryProvider(config).notifier).remove(state);
          },
        )
      ],
    );
  }
}
