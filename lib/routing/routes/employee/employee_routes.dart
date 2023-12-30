import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/typedefs/employee_id.dart';
import 'package:voleep_carclean_frontend/modules/employee/presentation/employee_edit/employee_edit_page.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';

class EmployeeRoutes {
  final String root;

  get create => "$root/new";

  update(EmployeeId id) => "$root/$id";

  EmployeeRoutes.forChild({
    required String parentPath,
  }) : root = "$parentPath/employee";

  List<RouteBase> get routes => [
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: "$root/:id",
          builder: (context, state) {
            final String id = state.pathParameters['id']!;
            return EmployeeEditPage(id: id);
          },
        )
      ];
}
