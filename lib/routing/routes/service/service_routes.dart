import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/service/domain/typedefs/service_types.dart';
import 'package:voleep_carclean_frontend/modules/service/presentation/service_edit/service_edit_page.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';

class ServiceRoutes {
  final String root;

  get create => "$root/new";

  update(ServiceId id) => "$root/$id";

  ServiceRoutes.forChild({
    required String parentPath,
  }) : root = "$parentPath/service";

  List<RouteBase> get routes => [
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: "$root/:id",
          builder: (context, state) {
            final String id = state.pathParameters['id']!;
            return ServiceEditPage(id: id);
          },
        )
      ];
}
