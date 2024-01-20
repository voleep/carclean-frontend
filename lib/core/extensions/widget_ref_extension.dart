import 'package:flutter_riverpod/flutter_riverpod.dart';

extension RefExtension on WidgetRef {
  changed<T>(ProviderListenable<T> listenable, void Function(T value) block) {
    listenManual(
      listenable,
      (previous, next) {
        if (previous != next) {
          block(next);
        }
      },
      fireImmediately: true,
    );
  }
}
