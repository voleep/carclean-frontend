import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_row_index.g.dart';

@riverpod
class SelectedRowIndex extends _$SelectedRowIndex {
  @override
  int? build(Key tableKey) {
    return null;
  }

  onSelectChanged(bool selected, int index) {
    if (selected == true) {
      state = null;
      return;
    }

    state = index;
  }

  unselect() {
    state = null;
  }
}
