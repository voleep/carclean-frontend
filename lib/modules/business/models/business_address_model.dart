import 'package:json_annotation/json_annotation.dart';

part 'business_address_model.g.dart';

@JsonSerializable()
class BusinessAddressModel {
  final String? isBusinessAddress;
  final String? dsPostalCode;
  final String? nmCity;
  final String? nmNeighborhood;
  final String? dsNumber;
  final String? dsComplement;

  BusinessAddressModel(
      {this.isBusinessAddress,
      this.dsPostalCode,
      this.nmCity,
      this.nmNeighborhood,
      this.dsNumber,
      this.dsComplement});

  factory BusinessAddressModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessAddressModelToJson(this);
}
