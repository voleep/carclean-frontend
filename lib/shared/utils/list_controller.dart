import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/shared/enums/selection.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/utils/selection_controller.dart';

class ListController<T> extends ValueNotifier<List<T>>
    implements SelectionController<T> {
  ListController({Selection selection = Selection.none})
      : _selection = selection,
        _selectionController = SelectionController(type: selection),
        _filterController = ValueNotifier([]),
        super([]);

  final Selection _selection;

  bool get selection => _selection != Selection.none;

  final ValueNotifier<List<Filter>> _filterController;

  Listenable get selectionListenable => _selectionController;

  List<T> get selected => _selectionController.value;

  final SelectionController<T> _selectionController;

  Listenable get filterListenable => _filterController;

  List<Filter> get filters => _filterController.value;

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

          if (selection && replacing != null && isSelected(replacing)) {
            unselect(replacing, notify: false);
            select(newItem, notify: false);
          }

          notifyListeners();
        }
      case Failure(:final exception):
        onFailure?.call(exception);
    }
  }

  void notifyFilterListeners() {
    _filterController.notifyListeners();
  }

  @override
  void dispose() {
    _selectionController.dispose();
    _filterController.dispose();
    super.dispose();
  }

  @override
  bool isSelected(T item) {
    if (!selection) return false;
    return _selectionController.isSelected(item);
  }

  @override
  void select(T item, {bool notify = true}) {
    if (!selection) return;
    _selectionController.select(item, notify: notify);
  }

  @override
  void toggle(T item) {
    if (!selection) return;
    _selectionController.toggle(item);
  }

  @override
  void unselect(T item, {bool notify = true}) {
    if (!selection) return;
    _selectionController.unselect(item, notify: notify);
  }
}
