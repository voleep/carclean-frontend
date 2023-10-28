import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/typedefs/business_id.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/typedefs/user_id.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/typedefs/user_token.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/typedefs/user_refresh_token.dart';

part 'auth_model.g.dart';
part 'auth_model.freezed.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
    required UserId userId,
    required BusinessId? businessId,
    required UserToken token,
    required UserRefreshToken refreshToken,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);
}
