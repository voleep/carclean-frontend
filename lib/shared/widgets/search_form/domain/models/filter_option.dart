import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/enums/filter_type.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/enum_option.dart';

part 'filter_option.freezed.dart';

@freezed
class FilterOption with _$FilterOption {
  const factory FilterOption({
    required String title,
    required String field,
    required FilterType type,
    List<EnumOption>? enumOptions,
  }) = _FilterOption;
}
