import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/typedefs/customer_id.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer-form/customer_form_page.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';

class CustomerRoutes {
  final String root;

  get create => "$root/${FormMode.create.name}";
  update(CustomerId id) => "$root/$id/${FormMode.update.name}";
  copy(CustomerId id) => "$root/$id/${FormMode.copy.name}";

  CustomerRoutes.forChild({
    required String parentPath,
  }) : root = "$parentPath/customer";

  List<RouteBase> get routes => [
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: "$root/:id/:mode",
          builder: (context, state) {
            final String id = state.pathParameters['id']!;
            final String mode = state.pathParameters['mode']!;
            return CustomerFormPage(
              customerId: id,
              mode: FormMode.valueOf(mode),
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: create,
          builder: (context, state) {
            return const CustomerFormPage(
              mode: FormMode.create,
            );
          },
        )
      ];
}
