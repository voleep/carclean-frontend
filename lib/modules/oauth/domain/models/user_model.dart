import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/business/models/business_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String idUser;
  final BusinessModel? business;
  final String nmUser;
  final String dsEmail;
  final String? nrPhone;
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  final DateTime dhInclusion;
  final int stUser;
  final int tpUser;

  const UserModel({
    required this.idUser,
    this.business,
    required this.nmUser,
    required this.dsEmail,
    this.nrPhone,
    required this.dhInclusion,
    required this.stUser,
    required this.tpUser,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  static DateTime _fromJsonTimestamp(int int) =>
      DateTime.fromMillisecondsSinceEpoch(int);

  static int _toJsonTimestamp(DateTime time) => time.millisecondsSinceEpoch;
}
