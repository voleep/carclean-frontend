import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/create_account/create_account_view_controller.dart';

final createAccountViewControllerProvider = StateNotifierProvider.autoDispose<
    CreateAccountViewController,
    AsyncValue<void>>((ref) => CreateAccountViewController(ref: ref));
