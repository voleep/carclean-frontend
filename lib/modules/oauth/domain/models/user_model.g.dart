// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      idUser: json['idUser'] as String,
      business: json['business'] == null
          ? null
          : BusinessModel.fromJson(json['business'] as Map<String, dynamic>),
      nmUser: json['nmUser'] as String,
      dsEmail: json['dsEmail'] as String,
      nrPhone: json['nrPhone'] as String?,
      dhInclusion: UserModel._fromJsonTimestamp(json['dhInclusion'] as int),
      stUser: json['stUser'] as int,
      tpUser: json['tpUser'] as int,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'idUser': instance.idUser,
      'business': instance.business,
      'nmUser': instance.nmUser,
      'dsEmail': instance.dsEmail,
      'nrPhone': instance.nrPhone,
      'dhInclusion': UserModel._toJsonTimestamp(instance.dhInclusion),
      'stUser': instance.stUser,
      'tpUser': instance.tpUser,
    };
