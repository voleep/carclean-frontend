import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/providers/shared_preferences.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/constants/constants.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/models/auth_model.dart';

part 'oauth_session.g.dart';

@Riverpod(keepAlive: true)
class OAuthSession extends _$OAuthSession {
  @override
  AsyncValue<AuthModel?> build() {
    final prefs = ref.read(sharedPreferencesProvider);

    final userId = prefs.getString(Constants.userId);
    final token = prefs.getString(Constants.token);
    final refreshToken = prefs.getString(Constants.refreshToken);
    final businessId = prefs.getString(Constants.businessId);

    if (userId == null || token == null || refreshToken == null) {
      prefs.clear();
      return const AsyncData(null);
    }

    return AsyncData(
      AuthModel(
        userId: userId,
        token: token,
        refreshToken: refreshToken,
        businessId: businessId,
      ),
    );
  }

  Future<void> set({required AuthModel authModel}) async {
    final prefs = ref.read(sharedPreferencesProvider);

    await prefs.setString(Constants.userId, authModel.userId);
    await prefs.setString(Constants.token, authModel.token);
    await prefs.setString(Constants.refreshToken, authModel.refreshToken);
    await prefs.remove(Constants.businessId);

    if (authModel.businessId != null) {
      await prefs.setString(Constants.businessId, authModel.businessId!);
    }

    state = AsyncData(authModel);
  }

  Future<void> clear() async {
    await ref.read(sharedPreferencesProvider).clear();
    state = const AsyncData(null);
  }
}
