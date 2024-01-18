import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/config/api_config.dart';
import 'package:voleep_carclean_frontend/core/constants/strings.dart';
import 'package:voleep_carclean_frontend/core/exceptions/http_exception.dart';
import 'package:voleep_carclean_frontend/core/exceptions/repository_exception.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/modules/employee/data/models/create_employee_model.dart';
import 'package:voleep_carclean_frontend/modules/employee/data/models/employee_model.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/typedefs/employee_id.dart';
import 'package:voleep_carclean_frontend/shared/enums/http_method.dart';
import 'package:voleep_carclean_frontend/shared/models/generic_response_model.dart';

part 'employee_repository.g.dart';

@riverpod
EmployeeRepository employeeRepository(EmployeeRepositoryRef ref) =>
    EmployeeRepository(
      http: ref.watch(httpClientProvider),
    );

class EmployeeRepository {
  final HttpClient http;

  get endpoint => "${ApiConfig.CARCLEAN_API_URL}/employee";

  const EmployeeRepository({required this.http});

  Future<Either<RepositoryException, Employee>> findById(
      EmployeeId emplyeeId) async {
    final getEmployeeResult = await http.get<EmployeeModel>(
      "$endpoint/$emplyeeId",
      fromJsonT: EmployeeModel.fromJson,
    );

    switch (getEmployeeResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(
            RepositoryException(Strings.colaboradorNaoEncontrado),
            StackTrace.current,
          );
        }

        return Success(
          Employee(
            employeeId: data.employeeId,
            name: data.name,
            telephone: data.telephone,
            registrationDate: data.registrationDate,
            situation: data.situation,
          ),
        );

      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
            RepositoryException(
                exception.message ?? Strings.erroAoCarregarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(Strings.erroAoCarregarDados),
          stackTrace,
        );
    }
  }

  Future<Either<RepositoryException, Employee>> save(
      CreateEmployeeModel dto, bool isNew) async {
    final saveResult = await http.request<EmployeeModel>(
      endpoint,
      method: isNew ? HttpMethod.post : HttpMethod.put,
      data: dto.toJson(),
      fromJsonT: EmployeeModel.fromJson,
    );

    switch (saveResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(
            RepositoryException(Strings.erroAoSalvarDados),
            StackTrace.current,
          );
        }

        return Success(
          Employee(
            employeeId: data.employeeId,
            name: data.name,
            telephone: data.telephone,
            registrationDate: data.registrationDate,
            situation: data.situation,
          ),
        );

      case Failure(:final exception, :final stackTrace):
        if (exception is HttpBadResponseException) {
          return Failure(
            RepositoryException(exception.message ?? Strings.erroAoSalvarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(Strings.erroAoSalvarDados),
          stackTrace,
        );
    }
  }
}
