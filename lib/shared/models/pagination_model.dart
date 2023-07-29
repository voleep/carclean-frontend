import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true)
class PaginationModel<T> with _$PaginationModel<T> {
  const PaginationModel._();

  const factory PaginationModel({
    required int numberOfItems,
    required int numberOfPages,
    required int currentPage,
    required List<T> pageData,
  }) = _PaginationModel<T>;

  factory PaginationModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$PaginationModelFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    return _$PaginationModelToJson<T>(this, toJsonT);
  }
}
