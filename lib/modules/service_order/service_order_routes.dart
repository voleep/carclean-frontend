import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_item_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_form/service_order_form_page.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_item_list/service_order_item_list_page.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_product_list/service_order_product_list_page.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';

abstract class ServiceOrderRoutes {
  static const list = '/ordem-servicos';

  static const services = '/ordem-servico/servicos';

  static const products = '/ordem-servico/produtos';

  static const create = '/ordem-servico/new';
}

final serviceOrderRoutes = <GoRoute>[
  GoRoute(
    path: 'servicos',
    builder: (context, state) {
      final itemList = state.extra as List<ServiceOrderItemModel>;

      return ServiceOrderItemListPage(modelList: itemList);
    },
  ),
  GoRoute(
    path: ":id",
    builder: (context, state) {
      final String id = state.pathParameters['id']!;
      return ServiceOrderFormPage(
        serviceOrderId: id,
        mode: FormMode.update,
      );
    },
  ),
  GoRoute(
    path: 'produtos',
    builder: (context, state) => const ServiceOrderProductListPage(),
  ),
];
