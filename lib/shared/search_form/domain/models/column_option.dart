import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class ColumnOption extends Equatable {
  final String title;
  final double width;
  final bool isFixed;

  const ColumnOption({required this.title, required this.width, this.isFixed = false});

  @override
  List<Object?> get props => [
        title,
        width,
        isFixed,
      ];
}
