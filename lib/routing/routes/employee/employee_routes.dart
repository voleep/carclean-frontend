import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/models/employee_model.dart';
import 'package:voleep_carclean_frontend/modules/employee/presentation/employee_form/employee_form_page.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';

class EmployeeRoutes {
  final String root;

  get create => "$root/${FormMode.create.name}";

  update(EmployeeId id) => "$root/$id/${FormMode.update.name}";

  copy(EmployeeId id) => "$root/$id/${FormMode.copy.name}";

  EmployeeRoutes.forChild({
    required String parentPath,
  }) : root = "$parentPath/employee";

  List<RouteBase> get routes => [
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: "$root/:id/:mode",
          builder: (context, state) {
            final String id = state.pathParameters['id']!;
            final String mode = state.pathParameters['mode']!;
            return EmployeeFormPage(
              employeeId: id,
              mode: FormMode.valueOf(mode),
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: Routes.i.navigationkey,
          path: create,
          builder: (context, state) {
            return EmployeeFormPage(
              mode: FormMode.create,
            );
          },
        )
      ];
}
