import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fab_option.freezed.dart';

@freezed
class FabOption with _$FabOption {
  const factory FabOption({
    required Widget child,
    required void Function() onPressed,
  }) = _FabOption;
}
