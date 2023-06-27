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

  Future<void> refresh([page = 1]) async {
    final queryList = ref.read(filterQueryProvider(arg)) ?? [];
    state = await AsyncValue.guard<PaginationModel<Map<String, dynamic>>?>(() async {
      final pagination = await _fetch(page: page, orderField: arg.orderField, searchQuery: queryList.join(","));
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
