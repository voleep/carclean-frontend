import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/enums/filter_condition.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/enums/filter_date_enum.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_query_state.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_query.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter_chips_view/filter_chips_view.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

class FilterDateView extends ConsumerWidget {
  FilterDateView({super.key, required this.config, required this.filterOption});

  final SearchConfig config;
  final FilterOption filterOption;

  final List<FilterDateEnum> _checkboxDateList = [
    FilterDateEnum.today,
    FilterDateEnum.yesterday,
    FilterDateEnum.thisWeek,
    FilterDateEnum.thisMonth,
    FilterDateEnum.lastMonth
  ];

  DateTime _getValueByDate(FilterDateEnum filterDate) {
    final DateTime now = DateTime.now();
    if (filterDate == FilterDateEnum.yesterday) {
      final DateTime yesterday = now.subtract(const Duration(days: 1));

      return DateTime(yesterday.year, yesterday.month, yesterday.day);
    }

    if (filterDate == FilterDateEnum.thisWeek) {
      final DateTime firstDayOfWeek = now.subtract(Duration(days: now.weekday));
      return DateTime(firstDayOfWeek.year, firstDayOfWeek.month, firstDayOfWeek.day);
    }

    if (filterDate == FilterDateEnum.thisMonth) {
      final DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
      return DateTime(firstDayOfMonth.year, firstDayOfMonth.month, firstDayOfMonth.day);
    }

    if (filterDate == FilterDateEnum.lastMonth) {
      final DateTime firstDayOfLastMonth = DateTime(now.year, now.month - 1, 1);
      return DateTime(firstDayOfLastMonth.year, firstDayOfLastMonth.month, firstDayOfLastMonth.day);
    }

    final DateTime today = DateTime(now.year, now.month, now.day);
    return today;
  }

  DateTime _getFinalValueByDate(FilterDateEnum filterDate) {
    final DateTime now = DateTime.now();
    if (filterDate == FilterDateEnum.yesterday) {
      final DateTime today = DateTime(now.year, now.month, now.day);
      return today;
    }

    if (filterDate == FilterDateEnum.thisWeek) {
      final DateTime lastDayOfWeek = now.add(Duration(days: DateTime.daysPerWeek - now.weekday));
      return DateTime(lastDayOfWeek.year, lastDayOfWeek.month, lastDayOfWeek.day);
    }

    if (filterDate == FilterDateEnum.thisMonth) {
      final DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 1);
      return DateTime(lastDayOfMonth.year, lastDayOfMonth.month, lastDayOfMonth.day);
    }

    if (filterDate == FilterDateEnum.lastMonth) {
      final DateTime lastDayOfLastMonth = DateTime(now.year, now.month, 1);
      return DateTime(lastDayOfLastMonth.year, lastDayOfLastMonth.month, lastDayOfLastMonth.day);
    }

    final DateTime tomorrow = now.add(const Duration(days: 1));
    return DateTime(tomorrow.year, tomorrow.month, tomorrow.day);
  }

  String _getDateLabelByValue({required DateTime value, DateTime? finalValue}) {
    final dateFormat = DateFormat("dd/MM/yyyy");
    final formattedValue = dateFormat.format(value);
    if (finalValue == null || value.add(const Duration(days: 1)) == finalValue) {
      return formattedValue;
    }
    return "$formattedValue a ${dateFormat.format(finalValue)}";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queryDateList =
        ref.watch(filterQueryProvider(config).select((value) => value?.where((element) => element.field == filterOption.field).toList() ?? []));

    return Column(
      children: [
        ..._checkboxDateList.asMap().entries.map((entry) {
          final filterDate = _checkboxDateList[entry.key];
          final currentQuery = queryDateList.firstWhereOrNull(
            (element) => element.valueLabel == _getDateLabelByValue(value: _getValueByDate(filterDate), finalValue: _getFinalValueByDate(filterDate)),
          );

          return CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: const EdgeInsets.only(left: 8),
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Theme.of(context).colorScheme.primary;
              }

              return Theme.of(context).colorScheme.outline;
            }),
            value: currentQuery != null,
            title: Text(
              filterDate.label(),
              style:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
            onChanged: (value) {
              if (value == true) {
                ref.read(filterQueryProvider(config).notifier).add(
                      FilterQueryState(
                        title: filterOption.title,
                        field: filterOption.field,
                        operator: FilterCondition.equals,
                        valueLabel: _getDateLabelByValue(value: _getValueByDate(filterDate), finalValue: _getFinalValueByDate(filterDate)),
                        value: _getValueByDate(filterDate),
                        finalValue: _getFinalValueByDate(filterDate),
                      ),
                    );
              } else if (currentQuery != null) {
                ref.read(filterQueryProvider(config).notifier).remove(currentQuery);
              }
            },
          );
        }).toList(),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              child: const Text("DIA ESPECÍFICO"),
              onPressed: () async {
                final DateTime now = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: now,
                  firstDate: DateTime(now.year - 5, now.month, now.day),
                  lastDate: DateTime(now.year + 5, now.month, now.day),
                  confirmText: "Confirmar",
                  cancelText: "Cancelar",
                );

                if (selectedDate != null) {
                  final DateTime dayAfterSelected = selectedDate.add(const Duration(days: 1));
                  ref.read(filterQueryProvider(config).notifier).add(
                        FilterQueryState(
                          title: filterOption.title,
                          field: filterOption.field,
                          operator: FilterCondition.equals,
                          valueLabel: _getDateLabelByValue(value: selectedDate),
                          value: DateTime(selectedDate.year, selectedDate.month, selectedDate.day).toString(),
                          finalValue: DateTime(dayAfterSelected.year, dayAfterSelected.month, dayAfterSelected.day).toString(),
                        ),
                      );
                }
              },
            ),
            TextButton(
              child: const Text("PERÍODO ESPECÍFICO"),
              onPressed: () async {
                final DateTime now = DateTime.now();
                final selectedDate = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(now.year - 5, now.month, now.day),
                  lastDate: DateTime(now.year + 5, now.month, now.day),
                  confirmText: "Confirmar",
                  cancelText: "Cancelar",
                );

                if (selectedDate != null) {
                  final finalDate = selectedDate.end.add(const Duration(days: 1));

                  ref.read(filterQueryProvider(config).notifier).add(
                        FilterQueryState(
                          title: filterOption.title,
                          field: filterOption.field,
                          operator: FilterCondition.equals,
                          valueLabel: _getDateLabelByValue(value: selectedDate.start, finalValue: selectedDate.end),
                          value: DateTime(selectedDate.start.year, selectedDate.start.month, selectedDate.start.day).toString(),
                          finalValue: DateTime(finalDate.year, finalDate.month, finalDate.day).toString(),
                        ),
                      );
                }
              },
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: FilterChipsView(
            config: config,
            field: filterOption.field,
            onPressed: (state) {},
          ),
        )
      ],
    );
  }
}
