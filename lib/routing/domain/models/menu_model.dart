import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/routing/domain/typedefs/menu_label.dart';
import 'package:voleep_carclean_frontend/routing/domain/typedefs/menu_location.dart';

part 'menu_model.freezed.dart';

@freezed
class MenuModel with _$MenuModel {
  const factory MenuModel({
    required MenuLocation location,
    required GlobalKey<NavigatorState> navigatorKey,
    required MenuLabel label,
    required IconData icon,
    required Widget child,
  }) = _MenuModel;
}
