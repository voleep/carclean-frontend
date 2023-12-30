import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';

extension AsyncValueUI<T> on AsyncValue<T> {
  bool get isLoading => this is AsyncLoading<T>;

  void showSnackBarOnError(BuildContext context) => whenOrNull(
        error: (error, _) {
          String errorMessage = error.toString();

          if (error is Exception) {
            errorMessage = error.message;
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              behavior: SnackBarBehavior.floating,
              margin: Responsive.isDesktop(context)
                  ? const EdgeInsets.symmetric(vertical: 10, horizontal: 180)
                  : null,
            ),
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

  void onFormSaved(BuildContext context) => whenOrNull(
        data: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Salvo com sucesso!'),
              behavior: SnackBarBehavior.floating,
            ),
          );
          context.pop();
        },
      );

  void runOnData(void Function(T value) fn) {
    if (value != null && hasValue && !isLoading && !hasError) {
      fn(value!);
    }
  }
}
