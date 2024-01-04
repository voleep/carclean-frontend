import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer_edit/customer_edit_page.dart';

abstract class CustomerRoutes {
  static const list = '/clientes';
  static String edit(String id) => '/cliente/$id';
}

final customerRoutes = [
  GoRoute(
    path: ":id",
    builder: (context, state) {
      final String id = state.pathParameters['id']!;
      return CustomerEditPage(id: id);
    },
  ),
];
