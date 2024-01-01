import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/enums/selection_type.dart';

part 'search_config.freezed.dart';

@freezed
class SearchConfig with _$SearchConfig {
  const factory SearchConfig({
    required String endpoint,
    required String orderField,
    required bool filterOnInit,
    @Default(SelectionType.none) SelectionType selectionMode,
  }) = _SearchConfig;
}
