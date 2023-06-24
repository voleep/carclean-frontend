import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/shared/responsive/responsive.dart';

typedef VoidAsyncValue = AsyncValue<void>;

extension AsyncValueUI on VoidAsyncValue {
  bool get isLoading => this is AsyncLoading<void>;

  void showSnackBarOnError(BuildContext context) => whenOrNull(
        error: (error, _) {
          String errorMessage = "Ocorreu um erro";

          if (error is Exception) {
            errorMessage = error.getMessage;
          }

          if (kIsWeb) {
            print(error);
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
}
