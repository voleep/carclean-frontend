import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';

part 'customer_api_dto.g.dart';

@JsonSerializable()
class CustomerApiDto {
  final String customerId;
  final String dsName;
  String? dsTelephone;
  String? dsEmail;
  String? dsDocument;
  String? dsNote;
  final DisabledEnabled stCustomer;

  CustomerApiDto({
    required this.customerId,
    required this.dsName,
    required this.stCustomer,
    this.dsTelephone,
    this.dsEmail,
    this.dsDocument,
    this.dsNote,
  });

  factory CustomerApiDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerApiDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerApiDtoToJson(this);

  CustomerModel toModel() {
    return CustomerModel(
      customerId: customerId,
      dsName: dsName,
      stCustomer: stCustomer,
      dsTelephone: dsTelephone,
      dsEmail: dsEmail,
      dsDocument: dsDocument,
      dsNote: dsNote,
    );
  }
}
