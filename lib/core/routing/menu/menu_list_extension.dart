import 'package:collection/collection.dart';
import 'package:voleep_carclean_frontend/core/routing/menu/menu.dart';

extension MenuListExtension on List<Menu> {
  int indexOfPath(String path) {
    final index = indexWhere((menu) => menu.path.startsWith(path));
    return index < 0 ? 0 : index;
  }

  bool anyWithPath(String path) {
    return any((menu) => menu.path.startsWith(path));
  }

  bool noneWithPath(String path) {
    return none((menu) => menu.path.startsWith(path));
  }

  Menu? firstWithPath(String path) {
    return where((menu) => menu.path.startsWith(path)).firstOrNull;
  }
}
