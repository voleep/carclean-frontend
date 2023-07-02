import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' as material show IconData, Widget, immutable, GlobalKey, NavigatorState;
import 'package:voleep_carclean_frontend/routing/domain/typedefs/menu_label.dart';
import 'package:voleep_carclean_frontend/routing/domain/typedefs/menu_location.dart';

@material.immutable
class MenuModel extends Equatable {
  final MenuLocation location;
  final material.GlobalKey<material.NavigatorState> navigatorKey;
  final MenuLabel label;
  final material.IconData icon;
  final material.Widget child;

  const MenuModel({
    required this.location,
    required this.navigatorKey,
    required this.label,
    required this.icon,
    required this.child,
  });

  @override
  List<Object?> get props => [location, label, icon, child];
}
