import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/employee/presentation/employee_edit/employee_edit_page.dart';
import 'package:voleep_carclean_frontend/modules/employee/presentation/employee_list/employee_list_page.dart';
import 'package:voleep_carclean_frontend/shared/enums/selection.dart';

abstract class EmployeeRoutes {
  static const list = '/colaboradores';

  static const create = '/colaborador/new';

  static final singleSelection = '/colaborador/selecionar/${Selection.single}';

  static final multiSelection = '/colaborador/selecionar/${Selection.multi}';

  static String edit(String id) => '/colaborador/$id';
}

final employeeRoutes = <GoRoute>[
  GoRoute(
    path: "selecionar/:selection",
    builder: (context, state) {
      final selection = state.pathParameters['selection']!;
      return EmployeeListPage(
        selection: Selection.byName(selection),
      );
    },
  ),
  GoRoute(
    path: ":id",
    builder: (context, state) {
      final String id = state.pathParameters['id']!;
      return EmployeeEditPage(id: id);
    },
  ),
];
