import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/models/employee_model.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/models/service_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/typedefs/service_order_typedefs.dart';

part 'service_order_item_model.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class ServiceOrderItemModel extends Equatable {
  final ServiceOrderItemId serviceOrderItemId;
  final ServiceModel service;
  final EmployeeModel employee;
  final double price;

  const ServiceOrderItemModel({
    required this.serviceOrderItemId,
    required this.service,
    required this.employee,
    required this.price,
  });

  factory ServiceOrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceOrderItemModelFromJson(json);

  @override
  List<Object?> get props => [
        serviceOrderItemId,
        service,
        employee,
        price,
      ];
}
