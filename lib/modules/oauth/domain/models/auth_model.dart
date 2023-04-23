import 'package:flutter/foundation.dart' show immutable;
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/typedefs/business_id.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/typedefs/user_id.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/typedefs/user_token.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/typedefs/user_refresh_token.dart';

part 'auth_model.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class AuthModel extends Equatable {
  final UserId userId;
  final BusinessId? businessId;
  final UserToken token;
  final UserRefreshToken refreshToken;

  const AuthModel({
    required this.userId,
    required this.businessId,
    required this.token,
    required this.refreshToken,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  AuthModel copiedWithBusinessId(BusinessId businessId) => AuthModel(
        userId: userId,
        token: token,
        businessId: businessId,
        refreshToken: refreshToken,
      );

  @override
  List<Object?> get props => [
        userId,
        token,
        businessId,
        refreshToken,
      ];
}
