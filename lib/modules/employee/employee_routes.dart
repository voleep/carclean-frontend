import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/employee/presentation/employee_edit/employee_edit_page.dart';

abstract class EmployeeRoutes {
  static const list = '/colaboradores';

  static String idit(String id) => '/colaborador/$id';
}

List<GoRoute> employeeRoutes = [
  GoRoute(
    path: ":id",
    builder: (context, state) {
      final String id = state.pathParameters['id']!;
      return EmployeeEditPage(id: id);
    },
  ),
];
