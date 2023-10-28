// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerModel _$$_CustomerModelFromJson(Map<String, dynamic> json) =>
    _$_CustomerModel(
      customerId: json['customerId'] as String,
      dsName: json['dsName'] as String,
      dsTelephone: json['dsTelephone'] as String?,
      dsEmail: json['dsEmail'] as String?,
      dsDocument: json['dsDocument'] as String?,
      dsNote: json['dsNote'] as String?,
      stCustomer: $enumDecode(_$DisabledEnabledEnumMap, json['stCustomer']),
    );

Map<String, dynamic> _$$_CustomerModelToJson(_$_CustomerModel instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'dsName': instance.dsName,
      'dsTelephone': instance.dsTelephone,
      'dsEmail': instance.dsEmail,
      'dsDocument': instance.dsDocument,
      'dsNote': instance.dsNote,
      'stCustomer': _$DisabledEnabledEnumMap[instance.stCustomer]!,
    };

const _$DisabledEnabledEnumMap = {
  DisabledEnabled.disabled: 0,
  DisabledEnabled.enabled: 1,
};
