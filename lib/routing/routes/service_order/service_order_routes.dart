import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer_list/customer_list_page.dart';
import 'package:voleep_carclean_frontend/modules/employee/presentation/employee_list/employee_list_page.dart';
import 'package:voleep_carclean_frontend/modules/product/presentation/product_list/product_list_page.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';
import 'package:voleep_carclean_frontend/modules/service/presentation/service_list/service_list_page.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_item_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_form/service_order_form_page.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_product_list/service_order_product_list_page.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_item_list/service_order_item_list_page.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/vehicle_list/vehicle_list_page.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';
import 'package:voleep_carclean_frontend/shared/widgets/search_form/domain/enums/selection_mode.dart';

class ServiceOrderRoutes {
  final String root;

  String get create => "$root/${FormMode.create.name}";

  String get selectCustomer => "$root/customer/select";

  String get selectVehicle => "$root/vehicle/select";

  String get productList => "$root/product";

  String get selectProduct => "$productList/select";

  String get serviceList => "$root/service";

  String get selectService => "$serviceList/select";

  String get selectEmployee => "$root/employee";

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
          builder: (context, state) => const CustomerListPage(
            selectionMode: true,
          ),
        ),
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: selectVehicle,
          builder: (context, state) => VehicleListPage(
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
          builder: (context, state) => ProductListPage(),
        ),
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: serviceList,
          builder: (context, state) {
            final itemList = state.extra as List<ServiceOrderItemModel>;

            return ServiceOrderItemListPage(modelList: itemList);
          },
        ),
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: selectService,
          builder: (context, state) => const ServiceListPage(
            selectionMode: SelectionMode.multi,
          ),
        ),
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: selectEmployee,
          builder: (context, state) => EmployeeListPage(
            selectionMode: SelectionMode.single,
          ),
        ),
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: create,
          builder: (context, state) {
            return ServiceOrderFormPage(
              mode: FormMode.create,
            );
          },
        ),
      ];
}
