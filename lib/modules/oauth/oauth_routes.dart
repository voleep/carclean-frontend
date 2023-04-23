import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/create_account/create_account_page.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/create_business/create_business_page.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/restore_password/forget_password_page.dart';

final oauthRoutes = [
  GoRoute(
    path: "forget-password",
    builder: (context, state) => const ForgetPasswordPage(),
  ),
  GoRoute(
    path: "create-account",
    builder: (context, state) => const CreateAccountPage(),
  ),
  GoRoute(
    path: "create-business",
    builder: (context, state) => const CreateBusinessPage(),
  ),
];
