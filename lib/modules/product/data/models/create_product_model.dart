import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';

part 'create_product_model.g.dart';

@JsonSerializable(createFactory: false)
class CreateProductModel {
  final String? productId;
  final String description;
  final double price;
  final double availableStock;
  final double pcCommission;
  final DisabledEnabled situation;

  const CreateProductModel({
    this.productId,
    required this.description,
    required this.price,
    required this.availableStock,
    required this.pcCommission,
    required this.situation,
  });

  Map<String, dynamic> toJson() => _$CreateProductModelToJson(this);
}
