import 'package:flutter_riverpod/flutter_riverpod.dart';

extension RefExtension on WidgetRef {
  observe<T>(ProviderListenable<T> listenable, void Function(T value) call) {
    listenManual(
      listenable,
      (previous, next) => call(next),
      fireImmediately: true,
    );
  }
}
