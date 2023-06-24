import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/enums/filter_condition.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/enums/filter_type.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_query_state.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_query.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_text_condition_provider.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter_chips_view/filter_chips_view.dart';

class FilterTextView extends ConsumerWidget {
  FilterTextView({
    super.key,
    required this.config,
    required this.filterOption,
  }) : assert(filterOption.type == FilterType.text);

  final SearchConfig config;
  final FilterOption filterOption;

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _textController,
              decoration: const InputDecoration(filled: true),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final condition = ref.watch(filterTextConditionProvider(config));

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: DropdownMenu<FilterCondition>(
                  width: 160,
                  initialSelection: condition,
                  inputDecorationTheme: const InputDecorationTheme(filled: true),
                  dropdownMenuEntries: [
                    DropdownMenuEntry<FilterCondition>(label: FilterCondition.includes.label(), value: FilterCondition.includes),
                    DropdownMenuEntry<FilterCondition>(label: FilterCondition.notIncludes.label(), value: FilterCondition.notIncludes),
                  ],
                  onSelected: (value) {
                    ref.read(filterTextConditionProvider(config).notifier).value = value ?? FilterCondition.includes;
                  },
                ),
              );
            },
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
                  Size(50, 50),
                ),
              ),
              onPressed: () {
                if (_textController.text.isEmpty) {
                  return;
                }

                final operator = ref.read(filterTextConditionProvider(config));
                final value = _textController.text;

                ref
                    .read(filterQueryProvider(config).notifier)
                    .add(FilterQueryState(title: filterOption.title, field: filterOption.field, operator: operator, valueLabel: value, value: value));

                _textController.text = "";
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
          _textController.text = state.value;
          ref.read(filterTextConditionProvider(config).notifier).value = state.operator;
          ref.read(filterQueryProvider(config).notifier).remove(state);
        },
      )
    ]);
  }
}
