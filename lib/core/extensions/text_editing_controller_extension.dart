import 'package:flutter/material.dart';

extension TextEditingControllerExtension on TextEditingController {
  set textOrEmpty(String? newText) {
    if (newText == text) return;

    text = newText ?? '';
  }
}
