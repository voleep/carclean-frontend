import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/typedefs/employee_id.dart';
import 'package:voleep_carclean_frontend/shared/converters/timestamp_converter.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';

part 'employee_model.g.dart';

@JsonSerializable()
class EmployeeModel {
  final EmployeeId employeeId;

  final String name;

  final String? telephone;

  @Timestamp()
  final DateTime registrationDate;

  final DisabledEnabled situation;

  const EmployeeModel({
    required this.employeeId,
    required this.name,
    this.telephone,
    required this.registrationDate,
    required this.situation,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => _$EmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);
}
