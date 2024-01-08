import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/core/extensions/go_router_extension.dart';
import 'package:voleep_carclean_frontend/modules/customer/customer_routes.dart';
import 'package:voleep_carclean_frontend/modules/employee/employee_routes.dart';
import 'package:voleep_carclean_frontend/modules/home/home_branches.dart';
import 'package:voleep_carclean_frontend/modules/home/presentation/app_page.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/create_account/create_account_page.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/create_business/create_business_page.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/login/login_page.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/restore_password/forget_password_page.dart';
import 'package:voleep_carclean_frontend/modules/product/product_routes.dart';
import 'package:voleep_carclean_frontend/modules/service/service_routes.dart';
import 'package:voleep_carclean_frontend/modules/service_order/service_order_routes.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/vehicle_routes.dart';

abstract class AppRoutes {
  static const login = '/entrar';
  static const register = '/criar-conta';
  static const registerBusiness = '/registrar-empresa';
  static const forgetPass = '/esqueceu-senha';
  static const home = '/home';
}

final List<RouteBase> appRoutes = [
  GoRoute(
    path: '/',
    redirect: (context, state) => AppRoutes.home,
  ),
  GoRoute(
    path: '/entrar',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/criar-conta',
    builder: (context, state) => const CreateAccountPage(),
  ),
  GoRoute(
    path: '/registrar-empresa',
    builder: (context, state) => const CreateBusinessPage(),
  ),
  GoRoute(
    path: '/esqueceu-senha',
    builder: (context, state) => const ForgetPasswordPage(),
  ),
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) => AppPage(
      navigationShell: navigationShell,
    ),
    branches: homeBranches,
  ),
  GoRoute(
    path: '/ordem-servico',
    redirect: (_, state) => state.ifMathFullOrNull('/ordem-servicos'),
    routes: serviceOrderRoutes,
  ),
  GoRoute(
    path: '/cliente',
    redirect: (_, state) => state.ifMathFullOrNull('/clientes'),
    routes: customerRoutes,
  ),
  GoRoute(
    path: '/produto',
    redirect: (context, state) => state.ifMathFullOrNull('/produtos'),
    routes: productRoutes,
  ),
  GoRoute(
    path: '/colaborador',
    redirect: (context, state) => state.ifMathFullOrNull('/colaboradores'),
    routes: employeeRoutes,
  ),
  GoRoute(
    path: '/servico',
    redirect: (context, state) => state.ifMathFullOrNull('/servicos'),
    routes: serviceRoutes,
  ),
  GoRoute(
    path: '/veiculo',
    redirect: (context, state) => state.ifMathFullOrNull('/veiculos'),
    routes: vehicleRoutes,
  ),
];
