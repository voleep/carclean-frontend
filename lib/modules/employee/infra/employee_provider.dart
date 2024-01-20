import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/modules/employee/application/create/create_employee_usecase.dart';
import 'package:voleep_carclean_frontend/modules/employee/application/create/default_create_employee_usecase.dart';
import 'package:voleep_carclean_frontend/modules/employee/application/get/default_get_employee_by_id_usecase.dart';
import 'package:voleep_carclean_frontend/modules/employee/application/get/get_employee_by_id_usecase.dart';
import 'package:voleep_carclean_frontend/modules/employee/application/list/find_all_employees_usecase.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/employee_gateway.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/repositories/employee_repository.dart';
import 'package:voleep_carclean_frontend/modules/employee/infra/default_employee_gateway.dart';
import 'package:voleep_carclean_frontend/modules/employee/infra/queries/default_find_all_employees_usecase.dart';
import 'package:voleep_carclean_frontend/modules/employee/infra/repositories/default_employee_repository.dart';

part 'employee_provider.g.dart';

@riverpod
EmployeeGateway employeeGateway(EmployeeGatewayRef ref) {
  final repository = ref.read(employeeRepositoryProvider);
  return DefaultEmployeeGateway(repository);
}

@riverpod
EmployeeRepository employeeRepository(EmployeeRepositoryRef ref) {
  final http = ref.read(httpClientProvider);
  return DefaultEmployeeRepository(http: http);
}

@riverpod
GetEmployeeByIdUseCase getEmployeeByIdUseCase(GetEmployeeByIdUseCaseRef ref) {
  final gateway = ref.read(employeeGatewayProvider);
  return DefaultGetEmployeeByIdUsecase(gateway);
}

@riverpod
FindAllEmployeesUsecase findAllEmployeesUsecase(
    FindAllEmployeesUsecaseRef ref) {
  final repository = ref.read(employeeRepositoryProvider);
  return DefaultFindAllEmployeesUsecase(repository);
}

@riverpod
CreateEmployeeUseCase createEmployeeUseCase(CreateEmployeeUseCaseRef ref) {
  final gateway = ref.read(employeeGatewayProvider);
  return DefaultCreateEmployeeUseCase(gateway);
}
