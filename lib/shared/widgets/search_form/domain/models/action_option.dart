import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_option.freezed.dart';

@freezed
class ActionOption with _$ActionOption {
  const factory ActionOption({
    required String title,
    required IconData icon,
    required Color backgroundColor,
    required VoidCallback onTap,
    Color? foregroundColor,
  }) = _ActionOption;
}
