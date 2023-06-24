import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' as material show IconData, Widget, immutable;
import 'package:voleep_carclean_frontend/routing/domain/models/menu_fab_options_model.dart';
import 'package:voleep_carclean_frontend/routing/domain/typedefs/menu_label.dart';
import 'package:voleep_carclean_frontend/routing/domain/typedefs/menu_location.dart';

@material.immutable
class MenuModel extends Equatable {
  final MenuLocation location;
  final MenuLabel label;
  final material.IconData icon;
  final material.Widget child;
  final MenuFabOptionsModel? fabOptions;

  const MenuModel({
    required this.location,
    required this.label,
    required this.icon,
    required this.child,
    this.fabOptions,
  });

  @override
  List<Object?> get props => [
        location,
        label,
        icon,
      ];
}
