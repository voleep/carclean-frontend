import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_edit_page/service_order_edit.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_items_page/service_order_items_page.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_product_list/service_order_product_list_page.dart';

abstract class ServiceOrderRoutes {
  static const list = '/ordem-servicos';

  static const products = '/ordem-servico/produtos';

  static const create = '/ordem-servico/new';

  static services(String id) => '/ordem-servico/$id/servicos';
}

final serviceOrderRoutes = <GoRoute>[
  GoRoute(
    path: ":id",
    builder: (context, state) {
      final String id = state.pathParameters['id']!;
      return ServiceOrderEditPage(id: id);
    },
  ),
  GoRoute(
    path: ':id/servicos',
    builder: (context, state) {
      final id = state.pathParameters['id']!;
      return ServiceOrderItemsPage(id: id);
    },
  ),
  GoRoute(
    path: 'produtos',
    builder: (context, state) => const ServiceOrderProductListPage(),
  ),
];
