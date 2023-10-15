import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/shared/models/pagination_model.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/data/repositories/search_repository.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/filter_query_state.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/presentation/filter/filter_query.dart';

part 'search_controller.g.dart';

@riverpod
class SearchController extends _$SearchController {
  final _itemsPerPage = 20;
  bool _isLoadingNewPage = false;
  late final SearchRepository searchRepository;

  @override
  AsyncValue<PaginationModel<Map<String, dynamic>>?> build(SearchConfig arg) {
    searchRepository = ref.read(searchRepositoryProvider(arg.endpoint));

    if (arg.filterOnInit) {
      search([]);
    }

    return const AsyncValue.data(null);
  }

  Future<void> search(List<FilterQueryState> queryList, [page = 1]) async {
    final listAllResult = await searchRepository.listAll(
      page: page,
      orderField: arg.orderField,
      searchQuery: queryList.join(","),
    );

    state = switch (listAllResult) {
      Success(:final value) => AsyncValue.data(value),
      Failure(:final exception, :final stackTrace) => AsyncValue.error(exception, stackTrace)
    };
  }

  Future<void> nextPage() async {
    if (_isLoadingNewPage) {
      return;
    }

    if (state.value == null) {
      return;
    }

    final currentPage = state.value!.currentPage;
    final numberOfPages = state.value!.numberOfPages;

    if (currentPage >= numberOfPages) {
      return;
    }

    _isLoadingNewPage = true;

    final queryList = ref.read(filterQueryProvider(arg)) ?? [];

    final listAllResult = await searchRepository.listAll(
      page: currentPage + 1,
      orderField: arg.orderField,
      searchQuery: queryList.join(","),
    );

    state = switch (listAllResult) {
      Success(:final value) => AsyncValue.data(value.copyWith(pageData: [...state.value!.pageData, ...value.pageData])),
      Failure(:final exception, :final stackTrace) => AsyncValue.error(exception, stackTrace)
    };

    _isLoadingNewPage = false;
  }

  Future<void> refreshByIndex(int index) async {
    final page = ((index / _itemsPerPage) + 1).floor();
    return refresh(page);
  }

  Future<void> refresh([page = 1]) async {
    if (state.value == null) {
      return;
    }

    final queryList = ref.read(filterQueryProvider(arg)) ?? [];
    final holePageData = [...state.value!.pageData];

    final listAllResult = await searchRepository.listAll(
      page: page,
      orderField: arg.orderField,
      searchQuery: queryList.join(","),
    );

    switch (listAllResult) {
      case Success(:final value):
        final fromItem = (page * _itemsPerPage) - _itemsPerPage;
        final tillItem = page * _itemsPerPage;

        final fromItemSafe = holePageData.length < fromItem ? holePageData.length : fromItem;
        final tillItemSafe = holePageData.length < tillItem ? holePageData.length : tillItem;

        holePageData.replaceRange(fromItemSafe, tillItemSafe, value.pageData);

        state = AsyncValue.data(state.value!.copyWith(pageData: holePageData));
      case Failure(:final exception, :final stackTrace):
        state = AsyncValue.error(exception, stackTrace);
    }

    _isLoadingNewPage = false;
  }

  Future<void> reload() async {
    state = const AsyncLoading();

    final queryList = ref.read(filterQueryProvider(arg)) ?? [];

    final listAllResult = await searchRepository.listAll(
      page: 1,
      orderField: arg.orderField,
      searchQuery: queryList.join(","),
    );

    state = switch (listAllResult) {
      Success(:final value) => AsyncValue.data(value),
      Failure(:final exception, :final stackTrace) => AsyncValue.error(exception, stackTrace)
    };
  }
}
