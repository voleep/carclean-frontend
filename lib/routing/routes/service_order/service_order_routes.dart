import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer-search/customer_search_page.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';
import 'package:voleep_carclean_frontend/modules/service_order/presentation/service_order_form/service_order_form_page.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/vehicle_search/vehicle_search_page.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';

class ServiceOrderRoutes {
  final String root;

  String get create => "$root/${FormMode.create.name}";

  String get selectCustomer => "$root/customer";

  String get selectVehicle => "$root/vehicle";

  String update(ServiceId id) => "$root/$id/${FormMode.update.name}";

  String copy(ServiceId id) => "$root/$id/${FormMode.copy.name}";

  ServiceOrderRoutes.forChild({
    required String parentPath,
  }) : root = "$parentPath/serviceorder";

  List<RouteBase> get routes => [
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: "$root/:id/:mode",
          builder: (context, state) {
            final String id = state.pathParameters['id']!;
            final String mode = state.pathParameters['mode']!;
            return ServiceOrderFormPage(
              serviceOrderId: id,
              mode: FormMode.valueOf(mode),
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
          path: create,
          builder: (context, state) {
            return const ServiceOrderFormPage(
              mode: FormMode.create,
            );
          },
        )
      ];
}
