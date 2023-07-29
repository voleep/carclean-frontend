import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';

part 'service_model.freezed.dart';
part 'service_model.g.dart';

@freezed
class ServiceModel with _$ServiceModel {
  const factory ServiceModel({
    required ServiceId serviceId,
    required int code,
    required String description,
    required String fullDescription,
    required double price,
    required double pcCommission,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);
}
