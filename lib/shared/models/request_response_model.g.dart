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
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      errorMessage: json['errorMessage'] as String?,
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);
