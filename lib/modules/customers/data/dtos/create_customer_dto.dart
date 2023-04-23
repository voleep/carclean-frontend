import 'package:json_annotation/json_annotation.dart';
part 'create_customer_dto.g.dart';

@JsonSerializable(createFactory: false)
class CreateCustomerDTO {
  final String? idCustomer;
  final String dsName;
  final String? dsTelephone;
  final String? dsEmail;
  final String? dsDocument;
  final String? dsNote;
  final int stCustomer;

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
