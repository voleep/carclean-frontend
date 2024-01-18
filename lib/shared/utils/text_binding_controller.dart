import 'package:flutter/material.dart';

class TextBindingController<T> extends ValueNotifier<T?> {
  TextBindingController(this._text, [T? value])
      : controller = TextEditingController(),
        super(value) {
    controller.addListener(_bindValue);
  }

  final String? Function(T? value) _text;

  final TextEditingController controller;

  _bindValue() {
    controller.text = _text(value) ?? "";
  }

  @override
  void dispose() {
    controller.removeListener(_bindValue);
    controller.dispose();
    super.dispose();
  }
}
