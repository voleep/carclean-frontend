import 'package:flutter/material.dart';
import 'package:voleep_carclean_frontend/shared/enums/selection.dart';

class SelectionController<T> extends ValueNotifier<List<T>> {
  SelectionController({
    required this.type,
    dynamic Function(T item)? key,
  })  : key = key ?? ((item) => item),
        super([]);

  final Selection type;

  final dynamic Function(T item) key;

  bool get typeNone => type == Selection.none;

  void unselect(T item, {bool notify = true}) {
    if (typeNone || !isSelected(item)) return;
    value.removeWhere((it) => key(it) == key(item));
    if (notify) notifyListeners();
  }

  void select(T item, {bool notify = true}) {
    if (typeNone || isSelected(item)) return;

    switch (type) {
      case Selection.single:
        value = [item];
      case Selection.multi:
        value.add(item);
      default:
        return;
    }

    if (notify) notifyListeners();
  }

  void toggle(T item) => isSelected(item) ? unselect(item) : select(item);

  bool isSelected(T item) {
    return value.where((it) => key(it) == key(item)).isNotEmpty;
  }
}
