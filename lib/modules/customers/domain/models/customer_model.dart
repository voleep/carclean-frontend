import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/customers/domain/typedefs/customer_id.dart';
part 'customer_model.g.dart';

@JsonSerializable()
@immutable
class CustomerModel extends Equatable {
  final CustomerId customerId;
  final String dsName;
  final String? dsTelephone;
  final String? dsEmail;
  final String? dsDocument;
  final String? dsNote;
  final int stCustomer;

  const CustomerModel({
    required this.customerId,
    required this.dsName,
    this.dsTelephone,
    this.dsEmail,
    this.dsDocument,
    this.dsNote,
    required this.stCustomer,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);

  @override
  List<Object?> get props => [
        customerId,
        dsName,
        dsTelephone,
        dsEmail,
        dsDocument,
        dsNote,
        stCustomer,
      ];
}
