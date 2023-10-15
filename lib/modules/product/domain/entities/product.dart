import 'package:flutter/foundation.dart' show immutable;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';
import 'package:voleep_carclean_frontend/modules/product/domain/typedefs/product_id.dart';

@immutable
class Product {
  final ProductId productId;

  final int code;

  final String description;

  final double price;

  final double availableStock;

  final double pcCommission;

  final DisabledEnabled situation;

  const Product({
    required this.productId,
    required this.code,
    required this.description,
    required this.price,
    required this.availableStock,
    required this.pcCommission,
    required this.situation,
  });
}
