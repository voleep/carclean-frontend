import 'package:flutter/foundation.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/typedefs/employee_id.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';

@immutable
class Employee {
  final EmployeeId employeeId;

  final String name;

  final String? telephone;

  final DateTime registrationDate;

  final DisabledEnabled situation;

  const Employee({
    required this.employeeId,
    required this.name,
    required this.registrationDate,
    required this.situation,
    this.telephone,
  });
}
