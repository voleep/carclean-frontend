import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';

part 'create_service_model.g.dart';

@JsonSerializable(createFactory: false)
class CreateServiceModel {
  final ServiceId? serviceId;

  final String description;

  final String fullDescription;

  final double price;

  final double pcCommission;

  const CreateServiceModel({
    this.serviceId,
    required this.description,
    required this.fullDescription,
    required this.price,
    required this.pcCommission,
  });

  Map<String, dynamic> toJson() => _$CreateServiceModelToJson(this);
}
