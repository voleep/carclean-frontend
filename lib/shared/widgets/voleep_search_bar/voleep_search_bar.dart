import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/app/presentation/app_page/app_page.dart';
import 'package:voleep_carclean_frontend/shared/enums/filter_condition.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/utils/debounce_time.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voelep_search_field/voleep_search_field.dart';

class VoleepSearchBar extends StatefulWidget {
  const VoleepSearchBar({
    super.key,
    required this.field,
    required this.filterNotifier,
  });

  final String field;

  final ValueNotifier<List<Filter>> filterNotifier;

  @override
  State<VoleepSearchBar> createState() => _VoleepSearchBarState();
}

class _VoleepSearchBarState extends State<VoleepSearchBar> {
  final debounceTime = DebounceTime(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      elevation: 0,
      titleSpacing: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
      title: VoleepSearchField(
        margin: context.canPop() ? null : const EdgeInsets.only(left: 12),
        onChanged: onSearch,
        onSubmitted: onSearch,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu_rounded, size: 27),
          onPressed: () => drawerKey.currentState?.open(),
        ),
      ],
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          )),
    );
  }

  void onSearch(String value) {
    debounceTime.run(() {
      final filters = List<Filter>.from(widget.filterNotifier.value);
      final index = widget.filterNotifier.value.indexWhere(
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

      widget.filterNotifier.value = filters;
    });
  }
}
