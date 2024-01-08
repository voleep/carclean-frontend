import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/core/extensions/theme_extension.dart';
import 'package:voleep_carclean_frontend/shared/enums/filter_condition.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/utils/debounce_time.dart';
import 'package:voleep_carclean_frontend/shared/utils/list_controller.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voelep_search_field/voleep_search_field.dart';

class VoleepSliverSearch<T> extends StatefulWidget {
  const VoleepSliverSearch({
    super.key,
    required this.field,
    required this.controller,
  });

  final String field;

  final ListController<T> controller;

  @override
  State<VoleepSliverSearch<T>> createState() => _VoleepSliverSearchState<T>();
}

class _VoleepSliverSearchState<T> extends State<VoleepSliverSearch<T>> {
  final debounceTime = DebounceTime(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(27),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  size: 28,
                ),
                hintText: "Pesquisar",
                hintStyle: TextStyle(color: context.colorScheme.surfaceVariant),
                prefixIconConstraints: const BoxConstraints(minWidth: 60),
                prefixIconColor: context.colorScheme.onSurfaceVariant,
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.all(18),
              ),
              style: const TextStyle(fontSize: 18),
              onChanged: onSearch,
              onFieldSubmitted: onSearch,
            ),
          ),
        )
      ],
    );
  }

  void onSearch(String value) {
    debounceTime.run(() {
      final filters = widget.controller.filters;
      final index = filters.indexWhere(
        (filter) => filter.field == widget.field,
      );

      if (index > -1) {
        filters.removeAt(index);
      }

      if (value.isNotEmpty) {
        final filter = Filter(
          field: widget.field,
          condition: FilterCondition.equals,
          value: value,
        );

        filters.add(filter);
      }

      widget.controller.notifyFilterListeners();
    });
  }
}
