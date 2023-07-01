// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_customer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateCustomerDTOToJson(CreateCustomerDTO instance) =>
    <String, dynamic>{
      'idCustomer': instance.idCustomer,
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
