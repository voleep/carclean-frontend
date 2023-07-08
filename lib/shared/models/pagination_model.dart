import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
@immutable
class PaginationModel<T> extends Equatable {
  final int numberOfItems;
  final int numberOfPages;
  final int currentPage;
  final List<T> pageData;

  const PaginationModel({
    required this.numberOfItems,
    required this.numberOfPages,
    required this.currentPage,
    required this.pageData,
  });

  PaginationModel<T> copyWith({
    int? numberOfItems,
    int? numberOfPages,
    int? currentPage,
    List<T>? pageData,
  }) =>
      PaginationModel(
        numberOfItems: numberOfItems ?? this.numberOfItems,
        numberOfPages: numberOfPages ?? this.numberOfPages,
        currentPage: currentPage ?? this.currentPage,
        pageData: pageData ?? this.pageData,
      );

  factory PaginationModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginationModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$PaginationModelToJson(this, toJsonT);

  @override
  List<Object?> get props => [
        numberOfItems,
        numberOfPages,
        currentPage,
        pageData,
      ];
}
