import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/carclean_app.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/core/extensions/message_extension.dart';

extension AsyncValueUI<T> on AsyncValue<T> {
  bool get isLoading => this is AsyncLoading<T>;

  void showSnackBarOnError(BuildContext context) => whenOrNull(
        error: (error, _) {
          String errorMessage = error.toString();

          if (error is Exception) {
            errorMessage = error.message;
          }

          Future.delayed(
            const Duration(milliseconds: 200),
            () => messengerKey.currentState?.showMessage(errorMessage),
          );
        },
      );

  void popOnFirstError(BuildContext context, AsyncValue? previous) =>
      whenOrNull(
        error: (_, __) {
          if (previous?.value == null) {
            context.pop();
          }
        },
      );

  void popOnData(BuildContext context) => whenOrNull(
        data: (_) {
          context.pop();
          Future.delayed(
            const Duration(milliseconds: 200),
            messengerKey.currentState?.showSaveSuccessMessage,
          );
        },
      );

  void runOnData(void Function(T value) fn) {
    if (value != null && hasValue && !isLoading && !hasError) {
      fn(value!);
    }
  }
}
