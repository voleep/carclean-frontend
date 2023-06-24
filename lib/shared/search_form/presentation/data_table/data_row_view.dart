import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/column_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/typedefs/actions_builder.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/typedefs/cells_builder.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/data_table/selected_row_actions.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/data_table/selected_row_index.dart';

class DataRowView<T> extends ConsumerWidget {
  const DataRowView(
      {super.key,
      required this.tableKey,
      required this.rowIndex,
      required this.rowItem,
      required this.columns,
      required this.cells,
      required this.actionsBuilder});

  final Key tableKey;
  final int rowIndex;
  final T rowItem;
  final List<ColumnOption> columns;
  final List<Widget> cells;
  final ActionsBuilder<T> actionsBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedRowIndexProvider(tableKey));
    final isSelected = selectedIndex == rowIndex;

    return Row(children: [
      Expanded(
        child: Material(
          child: InkWell(
            onTap: () {
              ref.read(selectedRowIndexProvider(tableKey).notifier).onSelectChanged(isSelected, rowIndex);
              ref.read(selectedRowActionsProvider(tableKey).notifier).onSelectChanged(isSelected, actionsBuilder(context, rowIndex, rowItem));
            },
            splashColor: Colors.transparent,
            child: Ink(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 1,
                      color: isSelected ? Theme.of(context).colorScheme.tertiary : Theme.of(context).colorScheme.outlineVariant.withOpacity(0.5)),
                ),
              ),
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isSelected ? Theme.of(context).colorScheme.tertiary.withOpacity(0.03) : null,
                  border: Border(
                    bottom: BorderSide(width: 2, color: isSelected ? Theme.of(context).colorScheme.tertiary : Colors.transparent),
                  ),
                ),
                child: Row(
                  children: cells.asMap().entries.map(
                    (entry) {
                      final column = columns[entry.key];
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        width: column.width,
                        child: entry.value,
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
