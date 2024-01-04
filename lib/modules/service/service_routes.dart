import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/service/presentation/service_edit/service_edit_page.dart';

abstract class ServiceRoutes {
  static const list = '/servicos';

  String edit(String id) => '/servico/$id';
}

final serviceRoutes = [
  GoRoute(
    path: ":id",
    builder: (context, state) {
      final String id = state.pathParameters['id']!;
      return ServiceEditPage(id: id);
    },
  ),
];
