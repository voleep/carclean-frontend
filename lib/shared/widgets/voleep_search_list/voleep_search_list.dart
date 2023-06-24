import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/debounce_time.dart';
import '../voleep_silver_appbar.dart';
import 'controllers/voleep_search_list_controller.dart';

class VoleepSearchList<T> extends ConsumerWidget {
  final String endpoint;
  final Widget Function(BuildContext context, int index, T item) itemBuilder;
  final T Function(Map<String, dynamic> json) fromJsonT;
  final String searchField;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;

  VoleepSearchList({
    Key? key,
    required this.endpoint,
    required this.itemBuilder,
    required this.fromJsonT,
    required this.searchField,
    this.automaticallyImplyLeading = true,
    this.actions,
  }) : super(key: key);

  final _debounceTime = DebounceTime(milliseconds: 500);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, _) => [
        VoleepSliverAppBar(
          titleSpacing: 24,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: double.infinity,
                height: 45,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                child: Center(
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Pesquisar',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) => _debounceTime
                        .run(() => ref.read(voleepSearchPageControllerProvider(endpoint).notifier).search(value: value, searchField: searchField)),
                    onSubmitted: (value) =>
                        ref.read(voleepSearchPageControllerProvider(endpoint).notifier).search(value: value, searchField: searchField),
                    onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                    onEditingComplete: () => FocusManager.instance.primaryFocus?.unfocus(),
                  ),
                ),
              ),
            ),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(8),
            child: Divider(
              height: 1,
            ),
          ),
          actions: actions ?? [Container()],
          snap: true,
          floating: true,
          automaticallyImplyLeading: automaticallyImplyLeading,
        )
      ],
      body: NotificationListener<ScrollNotification>(
        onNotification: (scroll) {
          final controller = ref.read(voleepSearchPageControllerProvider(endpoint).notifier);

          final metrics = scroll.metrics;
          if (metrics.pixels > metrics.maxScrollExtent - 100) {
            final bool hasMorePages = controller.currentPage < controller.numberOfPages;
            if (!controller.isLoadingMore && hasMorePages) {
              controller.fetchNextPage();
            }
          }
          return true;
        },
        child: RefreshIndicator(
          onRefresh: () async => {await ref.read(voleepSearchPageControllerProvider(endpoint).notifier).fetchFirstPage()},
          child: Consumer(builder: (context, ref, widget) {
            final controller = ref.watch(voleepSearchPageControllerProvider(endpoint));

            return controller.map(
              error: (error) {
                return const Center(
                  child: Text("Ocorreu um error"),
                );
              },
              data: (data) {
                final itemCount = data.value.length;

                return ListView.separated(
                  itemCount: ref.read(voleepSearchPageControllerProvider(endpoint).notifier).isLoadingMore ? itemCount + 1 : itemCount,
                  itemBuilder: (context, index) {
                    if (index == itemCount) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return itemBuilder(
                      context,
                      index,
                      fromJsonT(data.value[index]),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(height: 1);
                  },
                );
              },
              loading: (loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
