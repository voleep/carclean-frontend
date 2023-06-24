import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/typedefs/vehicle_typedefs.dart';
part 'create_vehicle_dto.g.dart';

@immutable
@JsonSerializable(createFactory: false)
class CreateVehicleDTO extends Equatable {
  final LicensePlate licensePlate;
  final String? description;

  const CreateVehicleDTO({
    required this.licensePlate,
    this.description,
  });

  Map<String, dynamic> toJson() => _$CreateVehicleDTOToJson(this);

  @override
  List<Object?> get props => [licensePlate, description];
}
