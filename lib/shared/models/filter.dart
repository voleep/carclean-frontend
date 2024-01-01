import 'package:voleep_carclean_frontend/shared/enums/filter_condition.dart';

class Filter {
  final String field;
  final FilterCondition condition;
  final dynamic value;

  const Filter({
    required this.field,
    required this.condition,
    required this.value,
  });

  @override
  String toString() {
    return field + condition.key() + value;
  }
}

extension FilterExtension on List<Filter> {
  String get query => map((filter) => first.toString()).join(",");
}
