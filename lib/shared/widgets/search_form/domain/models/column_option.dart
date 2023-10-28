import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'column_option.freezed.dart';

@freezed
class ColumnOption with _$ColumnOption {
  const factory ColumnOption({
    required String title,
    required double width,
    @Default(false) bool isFixed,
  }) = _ColumnOption;
}
