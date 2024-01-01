import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/models/page_response.dart';

final listScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class ScaffoldWithList<T, ID> extends StatefulWidget {
  const ScaffoldWithList({
    super.key,
    required this.selectId,
    required this.onGetItem,
    required this.onGetPage,
    required this.itemBuilder,
    required this.onTab,
    this.headerSliver,
    this.filterNotifier,
  });

  final ID Function(T item) selectId;

  final FutureOr<Either<Exception, T>> Function(ID id) onGetItem;

  final FutureOr<Either<Exception, PageResponse<T>>> Function(
      int page, List<Filter> filters) onGetPage;

  final Widget Function(BuildContext context, int index, T item) itemBuilder;

  final FutureOr<bool> Function(T item, int index) onTab;

  final Widget? headerSliver;

  final ValueNotifier<List<Filter>>? filterNotifier;

  @override
  State<ScaffoldWithList> createState() => _ScaffoldWithListState<T, ID>();
}

class _ScaffoldWithListState<T, ID> extends State<ScaffoldWithList<T, ID>> {
  final dataVN = ValueNotifier<List<T>>([]);
  final isLoadingVN = ValueNotifier(false);

  int currentPage = 1;

  @override
  void initState() {
    loadNextPage();
    widget.filterNotifier?.addListener(onFilterChanged);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: listScaffoldMessengerKey,
      child: Scaffold(
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
                    valueListenable: dataVN,
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
                                itemCount: dataVN.value.length,
                                itemBuilder: (context, index) {
                                  final item = dataVN.value[index];
                                  return GestureDetector(
                                    onTap: () => onTap(index),
                                    child: widget.itemBuilder(
                                        context, index, item),
                                  );
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
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add_rounded), onPressed: () async {}),
      ),
    );
  }

  Future<void> loadNextPage() async {
    if (isLoadingVN.value) return;

    isLoadingVN.value = true;
    final filters = widget.filterNotifier?.value ?? [];
    final result = await widget.onGetPage(currentPage, filters);

    switch (result) {
      case Success(:final value):
        dataVN.value = List.from(dataVN.value)..addAll(value.pageData);
        currentPage++;

      case Failure():
    }

    isLoadingVN.value = false;
  }

  Future<void> onTap(int index) async {
    final item = dataVN.value[index];
    final shouldRefresh = await widget.onTab(item, index);

    if (!shouldRefresh) return;
    final result = await widget.onGetItem(widget.selectId(item));

    switch (result) {
      case Success(value: final data):
        dataVN.value = List.from(dataVN.value)..[index] = data;
      default:
        if (kDebugMode) {
          print('Erro ao recarregar item da lista.');
        }
    }
  }

  void onFilterChanged() {
    onRefresh();
  }

  Future<void> onRefresh() async {
    currentPage = 1;
    dataVN.value = [];
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
    dataVN.dispose();
    isLoadingVN.dispose();
    widget.filterNotifier?.removeListener(onFilterChanged);

    super.dispose();
  }
}
