import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer_edit/customer_edit_page.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer_list/customer_list_page.dart';
import 'package:voleep_carclean_frontend/shared/enums/selection.dart';

abstract class CustomerRoutes {
  static const list = '/clientes';

  static const create = '/cliente/new';

  static final singleSelection = '/cliente/selecionar/${Selection.single.name}';

  static final multiSelection = '/cliente/selecionar/${Selection.multi.name}';

  static String edit(String id) => '/cliente/$id';
}

final customerRoutes = <GoRoute>[
  GoRoute(
    path: "selecionar/:selection",
    builder: (context, state) {
      final selection = state.pathParameters['selection']!;
      return CustomerListPage(
        selection: Selection.values.byName(selection),
      );
    },
  ),
  GoRoute(
    path: ":id",
    builder: (context, state) {
      final String id = state.pathParameters['id']!;
      return CustomerEditPage(id: id);
    },
  ),
];
