import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/service/presentation/service_edit/service_edit_page.dart';
import 'package:voleep_carclean_frontend/modules/service/presentation/service_list/service_list_page.dart';
import 'package:voleep_carclean_frontend/shared/enums/selection.dart';

abstract class ServiceRoutes {
  static const list = '/servicos';

  static const create = '/servico/new';

  static String selection(Selection selection) =>
      '/servico/selecionar/${selection.name}';

  static String edit(String id) => '/servico/$id';
}

final serviceRoutes = <GoRoute>[
  GoRoute(
    path: "selecionar/:selection",
    builder: (context, state) {
      final selection = state.pathParameters['selection']!;
      return ServiceListPage(
        selection: Selection.values.byName(selection),
      );
    },
  ),
  GoRoute(
    path: ":id",
    builder: (context, state) {
      final String id = state.pathParameters['id']!;
      return ServiceEditPage(id: id);
    },
  ),
];
