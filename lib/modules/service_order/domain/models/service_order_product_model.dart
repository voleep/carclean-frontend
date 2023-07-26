import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/models/employee_model.dart';
import 'package:voleep_carclean_frontend/modules/product/domain/models/product_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/typedefs/service_order_typedefs.dart';

part 'service_order_product_model.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class ServiceOrderProductModel extends Equatable {
  final ServiceOrderProductId serviceOrderProductId;
  final ProductModel product;
  final EmployeeModel employee;
  final double quantity;
  final double price;

  const ServiceOrderProductModel({
    required this.serviceOrderProductId,
    required this.product,
    required this.employee,
    required this.quantity,
    required this.price,
  });

  factory ServiceOrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceOrderProductModelFromJson(json);

  @override
  List<Object?> get props => [
        serviceOrderProductId,
        product,
        employee,
        quantity,
        price,
      ];
}
