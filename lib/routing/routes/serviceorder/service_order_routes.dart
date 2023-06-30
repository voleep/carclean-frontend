import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/serviceorder/domain/typedefs/service_order_types.dart';
import 'package:voleep_carclean_frontend/modules/serviceorder/presentation/service_order_form/service_order_form_page.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';

class ServiceOrderRoutes {
  final String root;

  get create => "$root/${FormMode.create.name}";

  update(ServiceOrderId id) => "$root/$id/${FormMode.update.name}";

  copy(ServiceOrderId id) => "$root/$id/${FormMode.copy.name}";

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
          path: create,
          builder: (context, state) {
            return const ServiceOrderFormPage(
              mode: FormMode.create,
            );
          },
        )
      ];
}
