import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/serviceorder/domain/typedefs/service_order_types.dart';

part 'service_order_model.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class ServiceOrderModel extends Equatable {
  final ServiceOrderId serviceOrderId;
  final int code;
  final String description;
  final String fullDescription;
  final double price;

  const ServiceOrderModel({
    required this.serviceOrderId,
    required this.code,
    required this.description,
    required this.fullDescription,
    required this.price,
  });

  factory ServiceOrderModel.fromJson(Map<String, dynamic> json) => _$ServiceOrderModelFromJson(json);

  @override
  List<Object?> get props => [
        serviceOrderId,
        code,
        description,
        fullDescription,
        price,
      ];
}
