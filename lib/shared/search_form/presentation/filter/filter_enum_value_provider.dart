import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/enum_option.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/search_config.dart';

part 'filter_enum_value_provider.g.dart';

@riverpod
class FilterEnumValue extends _$FilterEnumValue {
  @override
  EnumOption? build(SearchConfig config) {
    return null;
  }

  set value(EnumOption? option) {
    state = option;
  }
}
