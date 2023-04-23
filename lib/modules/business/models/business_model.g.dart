// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessModel _$BusinessModelFromJson(Map<String, dynamic> json) =>
    BusinessModel(
      idBusiness: json['idBusiness'] as String,
      dsBusinessName: json['dsBusinessName'] as String,
      dsCorporateName: json['dsCorporateName'] as String?,
      address: json['address'] == null
          ? null
          : BusinessAddressModel.fromJson(
              json['address'] as Map<String, dynamic>),
      dsDocument: json['dsDocument'] as String?,
      dsTelephone: json['dsTelephone'] as String?,
      dsEmail: json['dsEmail'] as String?,
      dsDescription: json['dsDescription'] as String?,
    );

Map<String, dynamic> _$BusinessModelToJson(BusinessModel instance) =>
    <String, dynamic>{
      'idBusiness': instance.idBusiness,
      'dsBusinessName': instance.dsBusinessName,
      'dsCorporateName': instance.dsCorporateName,
      'address': instance.address,
      'dsDocument': instance.dsDocument,
      'dsTelephone': instance.dsTelephone,
      'dsEmail': instance.dsEmail,
      'dsDescription': instance.dsDescription,
    };
