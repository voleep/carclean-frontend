import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_id.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_status.dart';

part 'employee_state.freezed.dart';

@freezed
abstract class EmployeeState with _$EmployeeState {
  EmployeeState._();
  factory EmployeeState({
    required EmployeeID id,
    required String name,
    required DateTime registrationDate,
    required EmployeeStatus status,
    String? phone,
    String? getFeedback,
    String? saveFeedback,
  }) = _EmployeeState;

  static EmployeeState from(Employee employee) {
    return EmployeeState(
      id: employee.id,
      name: employee.name,
      phone: employee.telephone,
      registrationDate: employee.registrationDate,
      status: employee.status,
    );
  }
}
