import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_data_table/selected_data_row_provider.dart';

class VoleepDataTable<T> extends ConsumerWidget {
  const VoleepDataTable({
    required Key key,
    required this.columns,
    required this.data,
    required this.cellsBuilder,
    this.onRowSelected,
  }) : super(key: key);

  final List<DataColumn> columns;
  final List<T> data;
  final List<DataCell> Function(BuildContext context, int index, T item) cellsBuilder;
  final Function(int index, T item, bool? selected)? onRowSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedDataRowIndexProvider(key!));

    return SingleChildScrollView(
      child: DataTable(
        showCheckboxColumn: false,
        columns: columns,
        rows: data
            .asMap()
            .entries
            .map((entry) => DataRow(
                color: MaterialStateColor.resolveWith((states) {
                  if (states.contains(MaterialState.hovered) && !states.contains(MaterialState.pressed)) {
                    return Theme.of(context).colorScheme.onInverseSurface;
                  }

                  if (states.contains(MaterialState.selected)) {
                    return Theme.of(context).colorScheme.surfaceVariant;
                  }

                  return Colors.transparent;
                }),
                selected: selectedIndex == entry.key,
                onSelectChanged: (selected) {
                  final notifier = ref.read(selectedDataRowIndexProvider(key!).notifier);

                  notifier.state = selected == true ? entry.key : null;

                  if (onRowSelected != null) {
                    onRowSelected!(entry.key, entry.value, selected);
                  }
                },
                cells: cellsBuilder(context, entry.key, entry.value)))
            .toList(),
      ),
    );
  }
}
