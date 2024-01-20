import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_id.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_status.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/states/employee_state.dart';

part 'create_employee_command.freezed.dart';

@freezed
abstract class CreateEmployeeCommand with _$CreateEmployeeCommand {
  factory CreateEmployeeCommand({
    required EmployeeID id,
    required String name,
    required DateTime registrationDate,
    required EmployeeStatus status,
    String? telephone,
  }) = _CreateEmployeeCommand;

  static CreateEmployeeCommand from(EmployeeState state) {
    return CreateEmployeeCommand(
      id: state.id,
      name: state.name,
      registrationDate: state.registrationDate,
      status: state.status,
      telephone: state.phone,
    );
  }
}
