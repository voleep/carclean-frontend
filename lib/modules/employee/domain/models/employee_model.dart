import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/shared/converters/timestamp_converter.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';

part 'employee_model.g.dart';

typedef EmployeeId = String;

@immutable
@JsonSerializable(createToJson: false)
class EmployeeModel extends Equatable {
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

  @override
  List<Object?> get props => [
        employeeId,
        name,
        telephone,
        registrationDate,
        situation,
      ];
}
