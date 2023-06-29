import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/models/employee_model.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';

part 'employee_request_dto.g.dart';

@JsonSerializable(createFactory: false, checked: true)
class EmployeeRequestDTO {
  final EmployeeId? employeeId;
  final String name;
  final String? telephone;
  final DisabledEnabled situation;

  const EmployeeRequestDTO({
    this.employeeId,
    required this.name,
    this.telephone,
    required this.situation,
  });

  Map<String, dynamic> toJson() => _$EmployeeRequestDTOToJson(this);
}
