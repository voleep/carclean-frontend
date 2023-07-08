import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/shared/enums/direction.dart';
import 'package:voleep_carclean_frontend/shared/models/pagination_model.dart';
import 'package:voleep_carclean_frontend/shared/search_form/data/repositories/search_repository.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_query_state.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/search_config.dart';
import 'package:voleep_carclean_frontend/shared/search_form/presentation/filter/filter_query.dart';

part 'search_controller.g.dart';

@riverpod
class SearchController extends _$SearchController {
  final _itemsPerPage = 20;
  bool _isLoadingNewPage = false;

  @override
  FutureOr<PaginationModel<Map<String, dynamic>>?> build(SearchConfig arg) async {
    if (arg.filterOnInit) {
      return await _fetch(page: 1, orderField: arg.orderField);
    }

    return null;
  }

  Future<void> search(List<FilterQueryState> queryList, [page = 1]) async {
    state = await AsyncValue.guard<PaginationModel<Map<String, dynamic>>?>(() async {
      final pagination = await _fetch(page: page, orderField: arg.orderField, searchQuery: queryList.join(","));
      return pagination;
    });
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

    try {
      final pagination = await _fetch(page: currentPage + 1, orderField: arg.orderField, searchQuery: queryList.join(","));
      state = AsyncValue.data(pagination.copyWith(pageData: [...state.value!.pageData, ...pagination.pageData]));
    } catch (exception) {}
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
    final holePageData = state.value!.pageData;
    try {
      final newPageData = (await _fetch(page: page, orderField: arg.orderField, searchQuery: queryList.join(","))).pageData;
      final fromItem = (page * _itemsPerPage) - _itemsPerPage;
      final tillItem = page * _itemsPerPage;

      final fromItemSafe = holePageData.length < fromItem ? holePageData.length : fromItem;
      final tillItemSafe = holePageData.length < tillItem ? holePageData.length : tillItem;

      holePageData.replaceRange(fromItemSafe, tillItemSafe, newPageData);

      state = AsyncValue.data(state.value!.copyWith(pageData: holePageData));
    } catch (exception) {}
    _isLoadingNewPage = false;
  }

  Future<void> reload() async {
    state = const AsyncLoading();
    final queryList = ref.read(filterQueryProvider(arg)) ?? [];
    state = await AsyncValue.guard<PaginationModel<Map<String, dynamic>>?>(() async {
      final pagination = await _fetch(page: 1, orderField: arg.orderField, searchQuery: queryList.join(","));
      return pagination;
    });
  }

  Future<PaginationModel<Map<String, dynamic>>> _fetch({
    required int page,
    required String orderField,
    String searchQuery = "",
    Direction orderDirection = Direction.asc,
  }) async {
    final pagination = await ref
        .read(
          searchRepositoryProvider(arg.endpoint),
        )
        .listAll(page: page, orderField: orderField, searchQuery: searchQuery, orderDirection: orderDirection);

    if (pagination == null) {
      throw Exception('Ocorreu um erro');
    }

    return pagination;
  }
}
