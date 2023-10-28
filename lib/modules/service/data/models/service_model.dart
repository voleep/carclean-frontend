import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';

part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
  final ServiceId serviceId;

  final int code;

  final String description;

  final String fullDescription;

  final double price;

  final double pcCommission;

  const ServiceModel({
    required this.serviceId,
    required this.code,
    required this.description,
    required this.fullDescription,
    required this.price,
    required this.pcCommission,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
