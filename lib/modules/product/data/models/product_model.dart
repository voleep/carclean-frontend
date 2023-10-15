import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';
import 'package:voleep_carclean_frontend/modules/product/domain/typedefs/product_id.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final ProductId productId;

  final int code;

  final String description;

  final double price;

  final double availableStock;

  final double pcCommission;

  final DisabledEnabled situation;

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

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
