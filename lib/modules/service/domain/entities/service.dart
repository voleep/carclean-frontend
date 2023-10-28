import 'package:flutter/foundation.dart' show immutable;
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';

@immutable
class Service {
  final ServiceId serviceId;

  final int code;

  final String description;

  final String fullDescription;

  final double price;

  final double pcCommission;

  const Service({
    required this.serviceId,
    required this.code,
    required this.description,
    required this.fullDescription,
    required this.price,
    required this.pcCommission,
  });
}
