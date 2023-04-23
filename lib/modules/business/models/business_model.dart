import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/business/models/business_address_model.dart';

part 'business_model.g.dart';

@JsonSerializable()
class BusinessModel {
  final String idBusiness;
  final String dsBusinessName;
  final String? dsCorporateName;
  final BusinessAddressModel? address;
  final String? dsDocument;
  final String? dsTelephone;
  final String? dsEmail;
  final String? dsDescription;

  BusinessModel(
      {required this.idBusiness,
      required this.dsBusinessName,
      this.dsCorporateName,
      this.address,
      this.dsDocument,
      this.dsTelephone,
      this.dsEmail,
      this.dsDescription});

  factory BusinessModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessModelFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessModelToJson(this);
}
