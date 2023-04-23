import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/shared/utils/debounce_time.dart';
import 'package:voleep_carclean_frontend/shared/voleep-search/presentation/voleep_search_controller.dart';

class VoleepSearchFilter extends ConsumerWidget {
  final VoleepSearchController controller;
  final String searchField;

  VoleepSearchFilter(
      {super.key, required this.controller, required this.searchField});

  final _debounceTime = DebounceTime(milliseconds: 500);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(top: 12, right: 12, left: 12),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: Center(
          child: TextField(
            textInputAction: TextInputAction.search,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Pesquisar',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) => _debounceTime.run(
              () => controller.search(
                  searchQuery: value.isNotEmpty ? "$searchField:$value" : ""),
            ),
            onSubmitted: (value) => controller.search(
                searchQuery: value.isNotEmpty ? "$searchField:$value" : ""),
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            onEditingComplete: () =>
                FocusManager.instance.primaryFocus?.unfocus(),
          ),
        ),
      ),
    );
  }
}
