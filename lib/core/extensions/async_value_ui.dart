import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';

typedef VoidAsyncValue = AsyncValue<void>;

extension AsyncValueUI on VoidAsyncValue {
  bool get isLoading => this is AsyncLoading<void>;

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
              margin: Responsive.isDesktop(context) ? const EdgeInsets.symmetric(vertical: 10, horizontal: 180) : null,
            ),
          );
        },
      );
}
