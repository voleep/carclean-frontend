import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/config/ApiConfig.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/core/http/providers/http_client_provider.dart';
import 'package:voleep_carclean_frontend/modules/employee/application/dtos/employee_request_dto.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/models/employee_model.dart';

part 'employee_service.g.dart';

@riverpod
EmployeeService employeeService(EmployeeServiceRef ref) => EmployeeService(http: ref.watch(httpClientProvider));

class EmployeeService {
  EmployeeService({required this.http});

  final HttpClient http;

  get endpoint => "${ApiConfig.CARCLEAN_API_URL}/employee";

  Future<EmployeeModel?> findById(EmployeeId emplyeeId) async {
    final response = await http.get("$endpoint/$emplyeeId");

    if (response.data == null) {
      return null;
    }

    return EmployeeModel.fromJson(response.data!);
  }

  Future<EmployeeModel?> save(EmployeeRequestDTO employeeRequestDTO) async {
    final response = await http.post(endpoint, data: employeeRequestDTO.toJson());

    if (response.data == null) {
      return null;
    }

    return EmployeeModel.fromJson(response.data!);
  }

  Future<EmployeeModel?> update(EmployeeRequestDTO employeeRequestDTO) async {
    final response = await http.put(endpoint, data: employeeRequestDTO.toJson());

    if (response.data == null) {
      return null;
    }

    return EmployeeModel.fromJson(response.data!);
  }
}
