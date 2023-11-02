import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_session.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/repositories/providers/user_repository_provider.dart';

class LoginViewController extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  LoginViewController({required this.ref}) : super(const AsyncData(null));

  Future<void> doLogin(final String email, final String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final sigInResponse = await ref.read(userRepositoryProvider).signIn(email: email, password: password);

      switch (sigInResponse) {
        case Success(value: final authModel):
          ref.read(oAuthSessionProvider.notifier).set(authModel: authModel);

        case Failure(:final exception):
          {}
      }
    });
  }
}
