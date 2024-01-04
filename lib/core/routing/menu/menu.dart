import 'package:flutter/widgets.dart';
import 'package:voleep_carclean_frontend/core/routing/menu/menu_group.dart';

class Menu {
  final String path;

  final String title;

  final IconData icon;

  final MenuGroup group;

  Menu({
    required this.path,
    required this.title,
    required this.icon,
    required this.group,
  });
}
