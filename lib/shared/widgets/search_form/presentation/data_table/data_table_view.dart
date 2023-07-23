import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/column_option.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/typedefs/actions_builder.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/typedefs/cells_builder.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/data_table/data_row_view.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class DataTableView<T> extends ConsumerWidget {
  const DataTableView(
      {required super.key,
      required this.data,
      required this.columns,
      required this.cellsBuilder,
      required this.actionsBuilder,
      this.tableHeight});

  final List<T> data;
  final List<ColumnOption> columns;
  final CellsBuilder<T> cellsBuilder;
  final ActionsBuilder<T> actionsBuilder;
  final double? tableHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fixedColumns = columns.where((column) => column.isFixed).toList();
    final hasFixedColumns = fixedColumns.isNotEmpty;
    final fixedColumnsWidth = hasFixedColumns
        ? fixedColumns
            .map((column) => column.width)
            .reduce((value, element) => value + element)
        : 0.0;
    final rightColumns = columns.where((column) => !column.isFixed).toList();
    final rightColumnWidth = rightColumns
        .map((column) => column.width)
        .reduce((value, element) => value + element);

    final List<Widget> headerWidgets = columns
        .map<Widget>(
          (col) => Container(
              height: 56,
              width: col.width,
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: Theme.of(context)
                        .colorScheme
                        .outlineVariant
                        .withOpacity(0.5),
                  ),
                ),
              ),
              child: Text(col.title,
                  style: const TextStyle(fontWeight: FontWeight.bold))),
        )
        .toList();

    if (!hasFixedColumns) {
      headerWidgets.insert(0, const SizedBox.shrink());
    }

    return HorizontalDataTable(
      leftHandSideColumnWidth: fixedColumnsWidth,
      rightHandSideColumnWidth: rightColumnWidth,
      isFixedHeader: true,
      elevation: 0,
      headerWidgets: headerWidgets,
      tableHeight: tableHeight,
      rightSideItemBuilder: (context, index) {
        final currentItem = data[index];

        return DataRowView<T>(
          tableKey: key!,
          rowIndex: index,
          rowItem: currentItem,
          columns: rightColumns,
          cells: cellsBuilder(context, index, currentItem)
              .asMap()
              .entries
              .where((entry) => !columns[entry.key].isFixed)
              .map((entry) => entry.value)
              .toList(),
          actionsBuilder: actionsBuilder,
        );
      },
      leftSideItemBuilder: hasFixedColumns
          ? (context, index) {
              final currentItem = data[index];

              return DataRowView<T>(
                tableKey: key!,
                rowIndex: index,
                rowItem: currentItem,
                columns: fixedColumns,
                cells: cellsBuilder(context, index, currentItem)
                    .asMap()
                    .entries
                    .where((entry) => columns[entry.key].isFixed)
                    .map((entry) => entry.value)
                    .toList(),
                actionsBuilder: actionsBuilder,
              );
            }
          : null,
      leftSideChildren: hasFixedColumns ? null : [],
      itemCount: data.length,
    );
  }
}
