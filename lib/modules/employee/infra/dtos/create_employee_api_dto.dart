import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_id.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_status.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';

part 'create_employee_model.g.dart';

@JsonSerializable(createFactory: false)
class CreateEmployeeApiDto {
  final EmployeeID employeeId;

  final String name;

  final String? telephone;

  final DisabledEnabled situation;

  const CreateEmployeeApiDto({
    required this.employeeId,
    required this.name,
    this.telephone,
    required this.situation,
  });

  Map<String, dynamic> toJson() => _$CreateEmployeeModelToJson(this);

  static CreateEmployeeApiDto from(Employee employee) {
    final situacao = employee.status == EmployeeStatus.enabled
        ? DisabledEnabled.enabled
        : DisabledEnabled.disabled;

    return CreateEmployeeApiDto(
      employeeId: employee.id,
      name: employee.name,
      telephone: employee.telephone,
      situation: situacao,
    );
  }
}
