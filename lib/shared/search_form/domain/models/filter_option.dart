import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:voleep_carclean_frontend/shared/search_form/domain/enums/filter_type.dart';
import 'package:voleep_carclean_frontend/shared/search_form/domain/models/enum_option.dart';

@immutable
class FilterOption extends Equatable {
  final String title;
  final String field;
  final FilterType type;
  final List<EnumOption>? enumOptions;

  const FilterOption({
    required this.title,
    required this.field,
    required this.type,
    this.enumOptions,
  });

  @override
  List<Object?> get props => [
        title,
        field,
        type,
        enumOptions,
      ];
}
