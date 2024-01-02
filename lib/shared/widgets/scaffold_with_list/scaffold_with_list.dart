import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/models/page_response.dart';
import 'package:voleep_carclean_frontend/shared/utils/list_controller.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scaffold_with_list/error_view.dart';

class ScaffoldWithList<T> extends StatefulWidget {
  const ScaffoldWithList({
    super.key,
    required this.controller,
    required this.onGetPage,
    required this.itemBuilder,
    required this.onNew,
    this.headerSliver,
    this.onDone,
  });

  final ListController<T> controller;

  final FutureOr<Either<Exception, PageResponse<T>>> Function(
      int page, List<Filter> filters) onGetPage;

  final Widget Function(BuildContext context, int index, T item) itemBuilder;

  final VoidCallback onNew;

  final VoidCallback? onDone;

  final Widget? headerSliver;

  @override
  State<ScaffoldWithList> createState() => _ScaffoldWithListState<T>();
}

class _ScaffoldWithListState<T> extends State<ScaffoldWithList<T>> {
  final firstPageLoading = ValueNotifier(false);
  final firstPageError = ValueNotifier<String?>(null);
  final nextPageLoading = ValueNotifier(false);
  final nextPageError = ValueNotifier<String?>(null);

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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            if (widget.headerSliver == null) return [];
            return [widget.headerSliver!];
          },
          body: NotificationListener<ScrollEndNotification>(
            onNotification: onScroll,
            child: RefreshIndicator(
              onRefresh: onRefresh,
              child: Scrollbar(
                child: ValueListenableBuilder(
                  valueListenable: widget.controller,
                  builder: (context, data, child) {
                    return ListView(
                      children: [
                        ...data.mapIndexed((index, item) {
                          return widget.itemBuilder(context, index, item);
                        }).toList()
                          ..add(SizedBox(height: data.isEmpty ? 350 : 0)),
                        ValueListenableBuilder(
                          valueListenable: nextPageLoading,
                          builder: (context, value, child) => SizedBox(
                            height: 60,
                            child: Visibility(
                              visible: value,
                              child: const Align(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: nextPageError,
                          builder: (context, value, child) {
                            final hasError = value != null;
                            return Visibility(
                              visible: hasError,
                              child: ErrorView(
                                message: value ?? '',
                                onTap: onTryAgain,
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: buildFloatingAction(),
    );
  }

  Widget buildFloatingAction() {
    final isSelection = widget.controller.selection;

    final children = <Widget>[
      FloatingActionButton(
        mini: isSelection,
        onPressed: widget.onNew,
        child: const Icon(Icons.add_rounded),
      ),
    ];

    if (isSelection) {
      children.add(
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: FloatingActionButton.extended(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.primaryContainer,
            label: const Text("Confirmar"),
            onPressed: () => widget.onDone?.call(),
          ),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: children,
    );
  }

  Future<void> loadNextPage() async {
    if (nextPageLoading.value) return;

    nextPageLoading.value = true;
    final filters = widget.controller.filters;
    final result = await widget.onGetPage(currentPage, filters);

    switch (result) {
      case Success(:final value):
        widget.controller.value = List.from(widget.controller.value)
          ..addAll(value.pageData);
        currentPage++;

      case Failure(:final exception):
        nextPageError.value = exception.message;
    }

    nextPageLoading.value = false;
  }

  void onTryAgain() {
    nextPageError.value = null;
    loadNextPage();
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
    firstPageLoading.dispose();
    firstPageError.dispose();
    nextPageLoading.dispose();
    nextPageError.dispose();
    widget.controller.filterListenable.removeListener(onFilterChanged);

    super.dispose();
  }
}
