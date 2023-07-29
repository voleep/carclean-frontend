import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_config.freezed.dart';

@freezed
class SearchConfig with _$SearchConfig {
  const factory SearchConfig({
    required String endpoint,
    required String orderField,
    required bool filterOnInit,
  }) = _SearchConfig;
}
