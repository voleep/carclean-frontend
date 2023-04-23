// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessAddressModel _$BusinessAddressModelFromJson(
        Map<String, dynamic> json) =>
    BusinessAddressModel(
      isBusinessAddress: json['isBusinessAddress'] as String?,
      dsPostalCode: json['dsPostalCode'] as String?,
      nmCity: json['nmCity'] as String?,
      nmNeighborhood: json['nmNeighborhood'] as String?,
      dsNumber: json['dsNumber'] as String?,
      dsComplement: json['dsComplement'] as String?,
    );

Map<String, dynamic> _$BusinessAddressModelToJson(
        BusinessAddressModel instance) =>
    <String, dynamic>{
      'isBusinessAddress': instance.isBusinessAddress,
      'dsPostalCode': instance.dsPostalCode,
      'nmCity': instance.nmCity,
      'nmNeighborhood': instance.nmNeighborhood,
      'dsNumber': instance.dsNumber,
      'dsComplement': instance.dsComplement,
    };
