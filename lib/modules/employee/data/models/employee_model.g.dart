// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    EmployeeModel(
      employeeId: json['employeeId'] as String,
      name: json['name'] as String,
      telephone: json['telephone'] as String?,
      registrationDate:
          const Timestamp().fromJson(json['registrationDate'] as int),
      situation: $enumDecode(_$DisabledEnabledEnumMap, json['situation']),
    );

Map<String, dynamic> _$EmployeeModelToJson(EmployeeModel instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'name': instance.name,
      'telephone': instance.telephone,
      'registrationDate': const Timestamp().toJson(instance.registrationDate),
      'situation': _$DisabledEnabledEnumMap[instance.situation]!,
    };

const _$DisabledEnabledEnumMap = {
  DisabledEnabled.disabled: 0,
  DisabledEnabled.enabled: 1,
};
