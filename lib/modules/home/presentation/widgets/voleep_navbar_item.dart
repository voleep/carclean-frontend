import 'package:flutter/material.dart';

class VoleepNavBarTabItem extends NavigationDestination {
  const VoleepNavBarTabItem(
      {super.key,
      required this.initialLocation,
      required Widget icon,
      required String label})
      : super(icon: icon, label: label);

  final String initialLocation;
}
