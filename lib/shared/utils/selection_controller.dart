import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/shared/enums/selection.dart';

class SelectionController<T> extends ValueNotifier<List<T>> {
  SelectionController({
    required Selection type,
    required String Function(T item) selectionKey,
  })  : _type = type,
        _selectionKey = selectionKey,
        super([]);

  final Selection _type;

  final String Function(T item) _selectionKey;

  void unselect(T item, {bool notify = true}) {
    if (!isSelected(item)) return;
    value.remove(item);
    if (notify) notifyListeners();
  }

  void select(T item, {bool notify = true}) {
    if (isSelected(item)) return;

    switch (_type) {
      case Selection.single:
        value = [item];
      case Selection.multiple:
        value.add(item);
      default:
        return;
    }

    if (notify) notifyListeners();
  }

  void toggle(T item) => isSelected(item) ? unselect(item) : select(item);

  bool isSelected(T item) {
    return value
        .where((it) => _selectionKey(it) == _selectionKey(item))
        .isNotEmpty;
  }
}
