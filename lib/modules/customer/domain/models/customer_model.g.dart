// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      customerId: json['customerId'] as String,
      dsName: json['dsName'] as String,
      dsTelephone: json['dsTelephone'] as String?,
      dsEmail: json['dsEmail'] as String?,
      dsDocument: json['dsDocument'] as String?,
      dsNote: json['dsNote'] as String?,
      stCustomer: json['stCustomer'] as int,
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'dsName': instance.dsName,
      'dsTelephone': instance.dsTelephone,
      'dsEmail': instance.dsEmail,
      'dsDocument': instance.dsDocument,
      'dsNote': instance.dsNote,
      'stCustomer': instance.stCustomer,
    };
