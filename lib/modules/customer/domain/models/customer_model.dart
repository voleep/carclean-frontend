import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/typedefs/customer_id.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';
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
  final DisabledEnabled stCustomer;

  const CustomerModel({
    required this.customerId,
    required this.dsName,
    this.dsTelephone,
    this.dsEmail,
    this.dsDocument,
    this.dsNote,
    required this.stCustomer,
  });

  CustomerModel copyWith({
    CustomerId? customerId,
    String? dsName,
    String? dsTelephone,
    String? dsEmail,
    String? dsDocument,
    String? dsNote,
    DisabledEnabled? stCustomer,
  }) =>
      CustomerModel(
        customerId: customerId ?? this.customerId,
        dsName: dsName ?? this.dsName,
        dsTelephone: dsTelephone ?? this.dsTelephone,
        dsEmail: dsEmail ?? this.dsEmail,
        dsDocument: dsDocument ?? this.dsDocument,
        dsNote: dsNote ?? this.dsNote,
        stCustomer: stCustomer ?? this.stCustomer,
      );

  factory CustomerModel.fromJson(Map<String, dynamic> json) => _$CustomerModelFromJson(json);

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
