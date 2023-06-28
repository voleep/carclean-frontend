import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';

part 'product_request_dto.g.dart';

@immutable
@JsonSerializable(createFactory: false)
class ProductRequestDTO extends Equatable {
  final String? productId;
  final String description;
  final double? price;
  final double? availableStock;
  final double? pcCommission;
  final int situation;

  const ProductRequestDTO({
    this.productId,
    required this.description,
    this.price,
    this.availableStock,
    this.pcCommission,
    required this.situation,
  });

  Map<String, dynamic> toJson() => _$ProductRequestDTOToJson(this);

  @override
  List<Object?> get props => [
        productId,
        description,
        price,
        availableStock,
        pcCommission,
        situation,
      ];
}
