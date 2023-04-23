import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginationModel<T> {
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

  factory PaginationModel.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$PaginationModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PaginationModelToJson(this, toJsonT);
}
