import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/models/action_option.dart';

part 'selected_row_actions.g.dart';

@riverpod
class SelectedRowActions extends _$SelectedRowActions {
  @override
  List<ActionOption>? build(Key tableKey) {
    return null;
  }

  onSelectChanged(bool selected, List<ActionOption> actions) {
    if (selected == true) {
      state = null;
      return;
    }

    state = actions;
  }

  unselect() {
    state = null;
  }
}
