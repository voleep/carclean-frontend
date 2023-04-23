import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart'
    show AsyncNotifier, AsyncData;
import 'package:voleep_carclean_frontend/core/states/providers/shared_preferences_provider.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/constants/constants.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/models/auth_model.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/typedefs/business_id.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/typedefs/user_id.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/typedefs/user_refresh_token.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/typedefs/user_token.dart';

class OAuthStateNotifier extends AsyncNotifier<AuthModel?> {
  @override
  FutureOr<AuthModel?> build() async {
    final prefs = ref.read(sharedPreferencesProvider);

    final UserId? userId = prefs.getString(Constants.userId);
    final BusinessId? businessId = prefs.getString(Constants.businessId);
    final UserToken? token = prefs.getString(Constants.token);
    final UserRefreshToken? refreshToken =
        prefs.getString(Constants.refreshToken);

    if (userId != null && token != null && refreshToken != null) {
      return AuthModel(
        userId: userId,
        token: token,
        businessId: businessId,
        refreshToken: refreshToken,
      );
    }

    prefs.clear();
    return null;
  }

  void saveAuthInfo({required AuthModel authModel}) {
    final prefs = ref.read(sharedPreferencesProvider);

    prefs.remove(Constants.userId);
    prefs.remove(Constants.businessId);
    prefs.remove(Constants.token);
    prefs.remove(Constants.refreshToken);

    prefs.setString(Constants.userId, authModel.userId);
    prefs.setString(
      Constants.token,
      authModel.token,
    );
    prefs.setString(
      Constants.refreshToken,
      authModel.refreshToken,
    );

    if (authModel.businessId != null) {
      prefs.setString(
        Constants.businessId,
        authModel.businessId!,
      );
    }

    state = AsyncData(authModel);
  }

  Future<void> logout() async {
    ref.read(sharedPreferencesProvider).clear();
    state = const AsyncData(null);
  }
}
