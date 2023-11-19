import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_session.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/repositories/user_repository.dart';

part 'login_form_vm.g.dart';

@riverpod
class LoginFormVM extends _$LoginFormVM {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  Future<void> signIn(final String email, final String password) async {
    state = const AsyncLoading();

    final response = await ref
        .read(userRepositoryProvider)
        .signIn(email: email, password: password);

    switch (response) {
      case Success(value: final authModel):
        {
          ref.read(oAuthSessionProvider.notifier).set(authModel: authModel);
          state = AsyncValue.data(authModel);
        }

      case Failure(:final exception, :final stackTrace):
        {
          state = AsyncError(exception.message, stackTrace);
        }
    }
  }
}
