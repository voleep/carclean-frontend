import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

typedef ProductId = String;

@immutable
@JsonSerializable(createToJson: false)
class ProductModel extends Equatable {
  final ProductId productId;
  final int code;
  final String description;
  final double price;
  final double availableStock;
  final double pcCommission;
  final int situation;

  const ProductModel({
    required this.productId,
    required this.code,
    required this.description,
    required this.price,
    required this.availableStock,
    required this.pcCommission,
    required this.situation,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  @override
  List<Object?> get props => [
        productId,
        code,
        description,
        price,
        availableStock,
        pcCommission,
        situation,
      ];
}
