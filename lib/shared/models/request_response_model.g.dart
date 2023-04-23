// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestResponseModel<T> _$RequestResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    RequestResponseModel<T>(
      errorCode: json['errorCode'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$RequestResponseModelToJson<T>(
  RequestResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'errorMessage': instance.errorMessage,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
