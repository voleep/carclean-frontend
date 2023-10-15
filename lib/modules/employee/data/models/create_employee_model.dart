import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/typedefs/employee_id.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';

part 'create_employee_model.g.dart';

@JsonSerializable(createFactory: false, checked: true)
class CreateEmployeeModel {
  final EmployeeId? employeeId;
  final String name;
  final String? telephone;
  final DisabledEnabled situation;

  const CreateEmployeeModel({
    this.employeeId,
    required this.name,
    this.telephone,
    required this.situation,
  });

  Map<String, dynamic> toJson() => _$CreateEmployeeModelToJson(this);
}
