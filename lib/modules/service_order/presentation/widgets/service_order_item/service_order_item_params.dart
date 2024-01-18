import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_order_item_params.g.dart';

@riverpod
ServiceOrderItemParams serviceOrderItemParams(ServiceOrderItemParamsRef ref) {
  throw UnimplementedError();
}

class ServiceOrderItemParams {
  final String uuid;

  final String soUuid;

  ServiceOrderItemParams({
    required this.uuid,
    required this.soUuid,
  });
}
