import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer-search/customer_search_page.dart';
import 'package:voleep_carclean_frontend/modules/product/presentation/product_search/product_search_page.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';
import 'package:voleep_carclean_frontend/modules/service/presentation/service_search/service_search_page.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_form/service_order_form_page.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_product_list/service_order_product_list_page.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_service_list/service_order_service_list_page.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/vehicle_search/vehicle_search_page.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';

class ServiceOrderRoutes {
  final String root;

  String get create => "$root/${FormMode.create.name}";

  String get selectCustomer => "$root/customer/select";

  String get selectVehicle => "$root/vehicle/select";

  String get productList => "$root/product";

  String get selectProduct => "$productList/select";

  String get serviceList => "$root/service";

  String get selectService => "$serviceList/select";

  String update(ServiceId id) => "$root/${FormMode.update.name}/$id";

  String copy(ServiceId id) => "$root/${FormMode.copy.name}/$id";

  ServiceOrderRoutes.forChild({
    required String parentPath,
  }) : root = "$parentPath/serviceorder";

  List<RouteBase> get routes => [
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: "$root/${FormMode.update.name}/:id",
          builder: (context, state) {
            final String id = state.pathParameters['id']!;
            return ServiceOrderFormPage(
              serviceOrderId: id,
              mode: FormMode.update,
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: selectCustomer,
          builder: (context, state) => const CustomerSearchPage(
            selectionMode: true,
          ),
        ),
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: selectVehicle,
          builder: (context, state) => VehicleSearchPage(
            selectionMode: true,
          ),
        ),
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: productList,
          builder: (context, state) => const ServiceOrderProductListPage(),
        ),
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: selectProduct,
          builder: (context, state) => ProductSearchPage(),
        ),
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: serviceList,
          builder: (context, state) => const ServiceOrderServiceListPage(),
        ),
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: selectService,
          builder: (context, state) => const ServiceSearchPage(),
        ),
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: create,
          builder: (context, state) {
            return const ServiceOrderFormPage(
              mode: FormMode.create,
            );
          },
        ),
      ];
}
