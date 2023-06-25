import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 8),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _textController,
                decoration: const InputDecoration(filled: true),
              ),
            ),
            const SizedBox(width: 5),
            Tooltip(
              message: "Adicionar",
              verticalOffset: 35,
              waitDuration: const Duration(seconds: 1),
              child: IconButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  if (_textController.text.isEmpty) {
                    return;
                  }

                  final operator = ref.read(filterTextConditionProvider(config));
                  final value = _textController.text;

                  ref.read(filterQueryProvider(config).notifier).add(
                      FilterQueryState(title: filterOption.title, field: filterOption.field, operator: operator, valueLabel: value, value: value));

                  _textController.text = "";
                },
                icon: const Icon(Icons.add_rounded),
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
      ]),
    );
  }
}
