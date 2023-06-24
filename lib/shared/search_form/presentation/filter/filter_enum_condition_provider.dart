import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/enums/filter_condition.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/search_config.dart';
part 'filter_enum_condition_provider.g.dart';

@riverpod
class FilterEnumCondition extends _$FilterEnumCondition {
  @override
  FilterCondition build(SearchConfig config) {
    return FilterCondition.equals;
  }

  set value(FilterCondition condition) {
    state = condition;
  }
}
