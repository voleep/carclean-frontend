// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$EmployeeRequestDTOToJson(EmployeeRequestDTO instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'name': instance.name,
      'telephone': instance.telephone,
      'situation': _$DisabledEnabledEnumMap[instance.situation]!,
    };

const _$DisabledEnabledEnumMap = {
  DisabledEnabled.disabled: 0,
  DisabledEnabled.enabled: 1,
};
