import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueExtension<T> on AsyncValue<T> {
  // Mantém o estado atual como estado anterior do novo estado.
  AsyncValue<T> mergeWith(AsyncValue<T> state) {
    return state.copyWithPrevious(this);
  }
}
