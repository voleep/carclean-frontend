import 'package:flutter/material.dart';

class VoleepNavigationRailDestination extends NavigationRailDestination {
  const VoleepNavigationRailDestination(
      {required this.initialLocation,
      required Widget icon,
      required Widget label})
      : super(icon: icon, label: label);

  final String initialLocation;
}
