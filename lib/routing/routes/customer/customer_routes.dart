import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/typedefs/customer_id.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer_edit/customer_edit_page.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';

class CustomerRoutes {
  final String root;

  get create => "$root/new";
  update(CustomerId id) => "$root/$id";

  CustomerRoutes.forChild({
    required String parentPath,
  }) : root = "$parentPath/customer";

  List<RouteBase> get routes => [
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: "$root/:id",
          builder: (context, state) {
            final String id = state.pathParameters['id']!;
            return CustomerEditPage(id: id);
          },
        )
      ];
}
