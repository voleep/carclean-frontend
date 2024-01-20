import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_id.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_status.dart';
import 'package:voleep_carclean_frontend/shared/converters/timestamp_converter.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';

part 'employee_api_dto.g.dart';

@JsonSerializable()
class EmployeeApiDto {
  final EmployeeID employeeId;

  final String name;

  final String? telephone;

  @Timestamp()
  final DateTime registrationDate;

  final DisabledEnabled situation;

  const EmployeeApiDto({
    required this.employeeId,
    required this.name,
    this.telephone,
    required this.registrationDate,
    required this.situation,
  });

  factory EmployeeApiDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeApiDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeApiDtoToJson(this);

  Employee toAggregate() {
    final status =
        situation.boolean ? EmployeeStatus.enabled : EmployeeStatus.disabled;
    return Employee(
      id: employeeId,
      name: name,
      telephone: telephone,
      registrationDate: registrationDate,
      status: status,
    );
  }
}
