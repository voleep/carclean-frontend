import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/typedefs/customer_id.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';
part 'create_customer_dto.g.dart';

@JsonSerializable(createFactory: false)
class CreateCustomerDTO {
  final CustomerId? idCustomer;
  final String dsName;
  final String? dsTelephone;
  final String? dsEmail;
  final String? dsDocument;
  final String? dsNote;
  final DisabledEnabled stCustomer;

  const CreateCustomerDTO({
    this.idCustomer,
    required this.dsName,
    this.dsTelephone,
    this.dsEmail,
    this.dsDocument,
    this.dsNote,
    required this.stCustomer,
  });

  Map<String, dynamic> toJson() => _$CreateCustomerDTOToJson(this);
}
