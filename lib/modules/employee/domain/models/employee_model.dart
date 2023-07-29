import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/shared/converters/timestamp_converter.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';

part 'employee_model.g.dart';
part 'employee_model.freezed.dart';

typedef EmployeeId = String;

@freezed
class EmployeeModel with _$EmployeeModel {
  const factory EmployeeModel({
    required EmployeeId employeeId,
    required String name,
    String? telephone,
    @Timestamp() required DateTime registrationDate,
    required DisabledEnabled situation,
  }) = _EmployeeModel;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => _$EmployeeModelFromJson(json);
}
