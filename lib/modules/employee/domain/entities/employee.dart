import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/commands/create_employee_command.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_id.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_status.dart';

part 'employee.freezed.dart';

@freezed
abstract class Employee with _$Employee {
  factory Employee({
    required EmployeeID id,
    required String name,
    required DateTime registrationDate,
    required EmployeeStatus status,
    String? telephone,
  }) = _Employee;

  static Employee create(CreateEmployeeCommand command) {
    return Employee(
      id: command.id,
      name: command.name,
      registrationDate: command.registrationDate,
      status: command.status,
      telephone: command.telephone,
    );
  }
}
