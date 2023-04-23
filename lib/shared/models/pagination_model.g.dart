// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel<T> _$PaginationModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginationModel<T>(
      numberOfItems: json['numberOfItems'] as int,
      numberOfPages: json['numberOfPages'] as int,
      currentPage: json['currentPage'] as int,
      pageData: (json['pageData'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$PaginationModelToJson<T>(
  PaginationModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'numberOfItems': instance.numberOfItems,
      'numberOfPages': instance.numberOfPages,
      'currentPage': instance.currentPage,
      'pageData': instance.pageData.map(toJsonT).toList(),
    };
