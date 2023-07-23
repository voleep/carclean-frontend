import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class ActionOption extends Equatable {
  final String title;
  final IconData icon;
  final Color? foregroundColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const ActionOption({required this.title, required this.icon, required this.backgroundColor, required this.onTap, this.foregroundColor});

  @override
  List<Object?> get props => [title, icon, onTap];
}
