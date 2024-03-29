import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_session.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/dtos/create_user_dto.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/repositories/user_repository.dart';

part 'create_account_form_vm.g.dart';

@riverpod
class CreateAccountFormVm extends _$CreateAccountFormVm {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  Future<void> signUp({
    required String nmUser,
    required String dsEmail,
    required String dsPassword,
    required String confirmPassword,
  }) async {
    state = const AsyncLoading();

    final createUserDTO = CreateUserDTO(
      nmUser: nmUser,
      dsEmail: dsEmail,
      dsPassword: dsPassword,
      confirmationPassword: confirmPassword,
    );

    final response = await ref.read(userRepositoryProvider).signUp(
          createUserDTO: createUserDTO,
        );

    switch (response) {
      case Success(value: final authModel):
        ref.read(oAuthSessionProvider.notifier).set(authModel: authModel);
        state = AsyncValue.data(authModel);
      case Failure(:final exception, :final stackTrace):
        state = AsyncError(exception.toString(), stackTrace);
    }
  }
}
