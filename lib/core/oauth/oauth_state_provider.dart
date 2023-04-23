import 'package:hooks_riverpod/hooks_riverpod.dart' show AsyncNotifierProvider;
import 'package:voleep_carclean_frontend/core/oauth/oauth_state_notifier.dart';
import 'package:voleep_carclean_frontend/modules/oauth/domain/models/auth_model.dart';

final oAuthStateProvider =
    AsyncNotifierProvider<OAuthStateNotifier, AuthModel?>(
  () => OAuthStateNotifier(),
);
