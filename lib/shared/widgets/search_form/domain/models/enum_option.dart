import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'enum_option.freezed.dart';

@freezed
class EnumOption with _$EnumOption {
  const factory EnumOption({
    required String title,
    required dynamic value,
  }) = _EnumOption;
}
