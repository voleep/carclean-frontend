import 'dart:async';

import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/shared/enums/selection.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/utils/filter_controller.dart';
import 'package:voleep_carclean_frontend/shared/utils/selection_controller.dart';

class ListController<T> extends ValueNotifier<List<T>> {
  ListController({
    Selection selection = Selection.none,
    dynamic Function(T item)? selectionKey,
  })  : selection = SelectionController(
          type: selection,
          key: selectionKey,
        ),
        super([]);

  final FilterController filter = FilterController();

  List<Filter> get filters => filter.filters;

  final SelectionController<T> selection;

  List<T> get selected => selection.value;

  Future<void> setFuture(
    FutureOr<Either<Exception, T>> Function() item, {
    T? replacing,
    void Function(Exception exception)? onFailure,
  }) async {
    final index = replacing != null ? value.indexOf(replacing) : -1;
    final result = await item();

    switch (result) {
      case Success(value: final newItem):
        {
          if (index > -1) {
            value.setAll(index, [newItem]);
          } else {
            value.add(newItem);
          }

          final updateSelection = !selection.typeNone && replacing != null;

          if (updateSelection && selection.isSelected(replacing)) {
            selection.unselect(replacing, notify: false);
            selection.select(newItem, notify: false);
          }

          notifyListeners();
        }
      case Failure(:final exception):
        onFailure?.call(exception);
    }
  }

  @override
  void dispose() {
    filter.dispose();
    selection.dispose();
    super.dispose();
  }
}
