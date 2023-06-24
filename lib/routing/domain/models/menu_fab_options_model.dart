import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class MenuFabOptionsModel extends Equatable {
  final IconData icon;
  final void Function(WidgetRef ref) onPressed;

  const MenuFabOptionsModel({
    this.icon = Icons.add_rounded,
    required this.onPressed,
  });

  @override
  List<Object?> get props => [icon, onPressed];
}
