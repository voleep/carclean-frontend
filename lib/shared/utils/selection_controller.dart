import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/shared/enums/selection.dart';

class SelectionController<T> extends ValueNotifier<List<T>> {
  SelectionController({required Selection type})
      : _type = type,
        super([]);

  final Selection _type;

  void unselect(T item, {bool notify = true}) {
    if (!value.contains(item)) return;
    value.remove(item);
    if (notify) notifyListeners();
  }

  void select(T item, {bool notify = true}) {
    if (value.contains(item)) return;

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

  void toggle(T item) => value.contains(item) ? unselect(item) : select(item);

  bool isSelected(T item) {
    return value.contains(item);
  }
}
