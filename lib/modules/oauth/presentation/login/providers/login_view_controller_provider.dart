import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/login/login_view_controller.dart';

final loginViewControllerProvider =
    StateNotifierProvider.autoDispose<LoginViewController, AsyncValue<void>>(
        (ref) => LoginViewController(ref: ref));
