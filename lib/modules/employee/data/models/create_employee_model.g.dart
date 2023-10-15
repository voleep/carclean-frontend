// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateEmployeeModelToJson(
        CreateEmployeeModel instance) =>
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
