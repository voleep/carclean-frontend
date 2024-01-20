import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/config/api_config.dart';
import 'package:voleep_carclean_frontend/core/constants/strings.dart';
import 'package:voleep_carclean_frontend/core/exceptions/http_exception.dart';
import 'package:voleep_carclean_frontend/core/exceptions/repository_exception.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/core/extensions/inline_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/fp/nil.dart';
import 'package:voleep_carclean_frontend/core/http/http_client.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_id.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/repositories/employee_repository.dart';
import 'package:voleep_carclean_frontend/modules/employee/infra/dtos/create_employee_api_dto.dart';
import 'package:voleep_carclean_frontend/modules/employee/infra/dtos/employee_api_dto.dart';
import 'package:voleep_carclean_frontend/shared/enums/http_method.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/models/generic_response_model.dart';
import 'package:voleep_carclean_frontend/shared/models/page_response.dart';

part 'default_employee_repository.g.dart';

@riverpod
EmployeeRepository employeeRepository(EmployeeRepositoryRef ref) =>
    DefaultEmployeeRepository(
      http: ref.watch(httpClientProvider),
    );

class DefaultEmployeeRepository implements EmployeeRepository {
  final HttpClient http;

  get endpoint => "${ApiConfig.CARCLEAN_API_URL}/employee";

  const DefaultEmployeeRepository({required this.http});

  @override
  Future<Either<RepositoryException, EmployeeApiDto?>> getById(
      EmployeeID emplyeeId) async {
    final getEmployeeResult = await http.get<EmployeeApiDto>(
      "$endpoint/$emplyeeId",
      fromJsonT: EmployeeApiDto.fromJson,
    );

    switch (getEmployeeResult) {
      case Success(value: GenericResponse(:final data)):
        {
          return Success(data);
        }
      case Failure(:final exception, :final stackTrace):
        {
          final message = exception.let((it) {
            if (it is HttpBadResponseException) {
              return it.message;
            }
            return Strings.erroAoCarregarDados;
          });

          return Failure(RepositoryException(message), stackTrace);
        }
    }
  }

  @override
  Future<Either<RepositoryException, Nil>> save(
      CreateEmployeeApiDto employee, bool isNew) async {
    final saveResult = await http.request<EmployeeApiDto>(
      endpoint,
      method: isNew ? HttpMethod.post : HttpMethod.put,
      data: employee.toJson(),
      fromJsonT: EmployeeApiDto.fromJson,
    );

    switch (saveResult) {
      case Success():
        {
          return Success(nil);
        }
      case Failure(:final exception, :final stackTrace):
        {
          final message = exception.let((it) {
            if (exception is HttpBadResponseException) {
              return exception.message;
            }
            return Strings.erroAoSalvarDados;
          });

          return Failure(RepositoryException(message), stackTrace);
        }
    }
  }

  @override
  Future<Either<RepositoryException, PageResponse<EmployeeApiDto>>> findAll(
      Query query) async {
    final response = await http.get<PageResponse<EmployeeApiDto>>(
      endpoint,
      fromJsonT: (json) => PageResponse.fromJson(json, EmployeeApiDto.fromJson),
      queryParameters: {"search": query},
    );

    switch (response) {
      case Success(value: final page):
        {
          return Success(page.data!);
        }
      case Failure(:final exception, :final stackTrace):
        {
          final repositoryException = RepositoryException(exception.message);
          return Failure(repositoryException, stackTrace);
        }
    }
    ;
  }
}
