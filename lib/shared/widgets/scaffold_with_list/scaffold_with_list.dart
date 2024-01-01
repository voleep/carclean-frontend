import 'dart:async';

import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/models/page_response.dart';
import 'package:voleep_carclean_frontend/shared/utils/list_controller.dart';

class ScaffoldWithList<T, ID> extends StatefulWidget {
  const ScaffoldWithList({
    super.key,
    required this.selectId,
    required this.controller,
    required this.onGetPage,
    required this.itemBuilder,
    required this.onNew,
    this.headerSliver,
    this.onDone,
  });

  final ID Function(T item) selectId;

  final ListController<T> controller;

  final FutureOr<Either<Exception, PageResponse<T>>> Function(
      int page, List<Filter> filters) onGetPage;

  final Widget Function(BuildContext context, int index, T item) itemBuilder;

  final VoidCallback onNew;

  final VoidCallback? onDone;

  final Widget? headerSliver;

  @override
  State<ScaffoldWithList> createState() => _ScaffoldWithListState<T, ID>();
}

class _ScaffoldWithListState<T, ID> extends State<ScaffoldWithList<T, ID>> {
  final isLoadingVN = ValueNotifier(false);

  int currentPage = 1;

  @override
  void initState() {
    loadNextPage();
    widget.controller.filterListenable.addListener(onFilterChanged);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            if (widget.headerSliver == null) return [];
            return [widget.headerSliver!];
          },
          body: RefreshIndicator(
            onRefresh: onRefresh,
            child: Scrollbar(
              child: NotificationListener<ScrollEndNotification>(
                onNotification: onScroll,
                child: ValueListenableBuilder(
                  valueListenable: widget.controller,
                  builder: (context, value, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: currentPage > 1,
                          replacement: const SizedBox(width: double.infinity),
                          child: Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.only(top: 12),
                              itemCount: widget.controller.value.length,
                              itemBuilder: (context, index) {
                                final item = widget.controller.value[index];
                                return widget.itemBuilder(context, index, item);
                              },
                            ),
                          ),
                        ),
                        Offstage(
                          offstage: !isLoadingVN.value,
                          child: const CircularProgressIndicator(),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            mini: widget.controller.selection,
            onPressed: widget.onNew,
            child: const Icon(Icons.add_rounded),
          ),
          Offstage(
            offstage: !widget.controller.selection,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: FloatingActionButton.extended(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.primaryContainer,
                icon: const Icon(Icons.done),
                label: const Text(
                  "Confirmar",
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () => widget.onDone?.call(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> loadNextPage() async {
    if (isLoadingVN.value) return;

    isLoadingVN.value = true;
    final filters = widget.controller.filters;
    final result = await widget.onGetPage(currentPage, filters);

    switch (result) {
      case Success(:final value):
        widget.controller.value = List.from(widget.controller.value)
          ..addAll(value.pageData);
        currentPage++;

      case Failure():
    }

    isLoadingVN.value = false;
  }

  void onFilterChanged() {
    onRefresh();
  }

  Future<void> onRefresh() async {
    currentPage = 1;
    widget.controller.value = [];
    await loadNextPage();
  }

  bool onScroll(ScrollEndNotification notification) {
    if (notification.metrics.pixels > 0 && notification.metrics.atEdge) {
      loadNextPage();
    }

    return true;
  }

  @override
  void dispose() {
    isLoadingVN.dispose();
    widget.controller.filterListenable.removeListener(onFilterChanged);

    super.dispose();
  }
}
