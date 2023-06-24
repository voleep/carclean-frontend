import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/customers/domain/typedefs/customer_id.dart';
import 'package:voleep_carclean_frontend/modules/customers/presentation/customer-form/customer_page.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';

class CustomerRoutes {
  static String name = "customer";

  final String root;

  get create => "$root/new";

  update(CustomerId id) => "$root/$id";

  CustomerRoutes.forChild({
    required String parentPath,
  }) : root = "$parentPath/$name";

  List<RouteBase> get routes => [
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: "$root/:id",
          builder: (context, state) {
            final CustomerId? customerId = state.pathParameters['id'];
            return CustomersPage(
              customerId: customerId,
            );
          },
        )
      ];
}
