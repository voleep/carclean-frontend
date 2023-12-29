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
            RepositoryException(message: Strings.colaboradorNaoEncontrado),
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
                message: exception.message ?? Strings.erroAoCarregarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(message: Strings.erroAoCarregarDados),
          stackTrace,
        );
    }
  }

  Future<Either<RepositoryException, Employee>> saveOrUpdate(
      CreateEmployeeModel createEmployeeModel) async {
    if (createEmployeeModel.employeeId != null) {
      return update(createEmployeeModel);
    }
    return save(createEmployeeModel);
  }

  Future<Either<RepositoryException, Employee>> save(
      CreateEmployeeModel createEmployeeModel) async {
    final createEmployeeResult = await http.post<EmployeeModel>(
      endpoint,
      data: createEmployeeModel.toJson(),
      fromJsonT: EmployeeModel.fromJson,
    );

    switch (createEmployeeResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(
            RepositoryException(message: Strings.erroAoSalvarDados),
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
                message: exception.message ?? Strings.erroAoSalvarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(message: Strings.erroAoSalvarDados),
          stackTrace,
        );
    }
  }

  Future<Either<RepositoryException, Employee>> update(
      CreateEmployeeModel createEmployeeModel) async {
    final updateEmployeeResult = await http.put<EmployeeModel>(
      endpoint,
      data: createEmployeeModel.toJson(),
      fromJsonT: EmployeeModel.fromJson,
    );

    switch (updateEmployeeResult) {
      case Success(value: GenericResponse(:final data)):
        if (data == null) {
          return Failure(
            RepositoryException(message: Strings.erroAoSalvarDados),
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
                message: exception.message ?? Strings.erroAoSalvarDados),
            stackTrace,
          );
        }

        return Failure(
          RepositoryException(message: Strings.erroAoSalvarDados),
          stackTrace,
        );
    }
  }
}
