import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/enums/filter_condition.dart';

part 'filter_query_state.freezed.dart';

@freezed
class FilterQueryState with _$FilterQueryState {
  const FilterQueryState._();

  const factory FilterQueryState({
    required String title,
    required String field,
    required FilterCondition operator,
    required String valueLabel,
    required dynamic value,
    dynamic finalValue,
  }) = _FilterQueryState;

  String formattedLabel() {
    return "$title ${operator.label().toLowerCase()} $valueLabel";
  }

  @override
  String toString() {
    if (finalValue != null) {
      return "$field${FilterCondition.greaterOrEquals.key()}$value,$field${FilterCondition.lower.key()}$finalValue";
    }
    return "$field${operator.key()}$value";
  }
}
