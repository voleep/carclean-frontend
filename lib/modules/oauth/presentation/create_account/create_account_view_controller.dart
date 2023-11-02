import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/core/oauth/oauth_session.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/dtos/create_user_dto.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/repositories/providers/user_repository_provider.dart';

class CreateAccountViewController extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  CreateAccountViewController({required this.ref}) : super(const AsyncData(null));

  Future<void> signUp({
    required String nmUser,
    required String dsEmail,
    required String dsPassword,
    required String confirmPassword,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final createUserDTO = CreateUserDTO(
          nmUser: nmUser, dsEmail: dsEmail, dsPassword: dsPassword, confirmationPassword: confirmPassword);

      final authModel = await ref.read(userRepositoryProvider).signUp(createUserDTO: createUserDTO);

      ref.read(oAuthSessionProvider.notifier).set(authModel: authModel);
    });
  }
}
