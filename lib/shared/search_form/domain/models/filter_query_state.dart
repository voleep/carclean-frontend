import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:voleep_carclean_frontend/shared/search_form/domain/enums/filter_condition.dart';

@immutable
class FilterQueryState extends Equatable {
  final String title;
  final String field;
  final FilterCondition operator;
  final String valueLabel;
  final dynamic value;
  final dynamic finalValue;

  const FilterQueryState(
      {required this.title, required this.field, required this.operator, required this.valueLabel, required this.value, this.finalValue});

  FilterQueryState copyWithOperator(FilterCondition operator) => FilterQueryState(
        title: title,
        field: field,
        operator: operator,
        valueLabel: valueLabel,
        value: value,
        finalValue: finalValue,
      );

  FilterQueryState copyWithValue(dynamic value) => FilterQueryState(
        title: title,
        field: field,
        operator: operator,
        valueLabel: valueLabel,
        value: value,
        finalValue: finalValue,
      );

  String formattedLabel() {
    return "$title ${operator.label().toLowerCase()} $valueLabel";
  }

  @override
  List<Object?> get props => [title, field, operator, valueLabel, value, finalValue];

  @override
  String toString() {
    if (finalValue != null) {
      return "$field${FilterCondition.greaterOrEquals.key()}$value,$field${FilterCondition.lower.key()}$finalValue";
    }
    return "$field${operator.key()}$value";
  }
}
