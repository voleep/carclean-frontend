import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';

part 'service_model.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class ServiceModel extends Equatable {
  final ServiceId serviceId;
  final int code;
  final String description;
  final String fullDescription;
  final double price;

  const ServiceModel({
    required this.serviceId,
    required this.code,
    required this.description,
    required this.fullDescription,
    required this.price,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

  @override
  List<Object?> get props => [
        serviceId,
        code,
        description,
        fullDescription,
        price,
      ];
}
