import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class EnumOption extends Equatable {
  final String title;
  final dynamic value;

  const EnumOption({required this.title, required this.value});

  @override
  List<Object?> get props => [title, value];
}
