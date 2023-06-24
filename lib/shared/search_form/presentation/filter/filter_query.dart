import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/filter_query_state.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/search_config.dart';

part 'filter_query.g.dart';

@riverpod
class FilterQuery extends _$FilterQuery {
  @override
  List<FilterQueryState>? build(SearchConfig config) {
    return null;
  }

  add(FilterQueryState query) {
    if (state == null) {
      state = [query];
      return;
    }

    final queryList = [...state!];
    queryList.add(query);
    state = queryList;
  }

  remove(FilterQueryState query) {
    if (state == null) {
      return;
    }

    final queryList = [...state!];
    queryList.remove(query);
    state = queryList;
  }

  clear() {
    state = null;
  }
}
