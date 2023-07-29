import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

typedef ProductId = String;

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required ProductId productId,
    required int code,
    required String description,
    required double price,
    required double availableStock,
    required double pcCommission,
    required int situation,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
