import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/customer/data/dtos/customer_api_dto.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/dtos/vehicle_api_dto.dart';
import 'package:voleep_carclean_frontend/shared/converters/timestamp_converter.dart';

part 'service_order_api_dto.g.dart';

@JsonSerializable(createToJson: false)
class ServiceOrderApiDto {
  final String uuid;
  final CustomerApiDto customer;
  final VehicleApiDto vehicle;
  final double discountTotal;
  final double netTotal;
  final double grossTotal;
  @Timestamp()
  final DateTime postingDate;

  ServiceOrderApiDto({
    required this.uuid,
    required this.customer,
    required this.vehicle,
    required this.discountTotal,
    required this.netTotal,
    required this.grossTotal,
    required this.postingDate,
  });

  factory ServiceOrderApiDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceOrderApiDtoFromJson(json);

  ServiceOrderModel toModel() {
    return ServiceOrderModel(
      customer: customer.toModel(),
      vehicle: vehicle.toModel(),
      discountTotal: discountTotal,
      netTotal: netTotal,
      grossTotal: grossTotal,
      postingDate: postingDate,
      serviceOrderItemList: [],
      serviceOrderProductList: [],
    );
  }
}
