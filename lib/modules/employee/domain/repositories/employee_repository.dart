import 'package:voleep_carclean_frontend/core/exceptions/repository_exception.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/fp/nil.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_id.dart';
import 'package:voleep_carclean_frontend/modules/employee/infra/dtos/create_employee_api_dto.dart';
import 'package:voleep_carclean_frontend/modules/employee/infra/dtos/employee_api_dto.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/models/page_response.dart';

abstract class EmployeeRepository {
  Future<Either<RepositoryException, EmployeeApiDto?>> getById(EmployeeID id);

  Future<Either<RepositoryException, PageResponse<EmployeeApiDto>>> findAll(
      Query query);

  Future<Either<RepositoryException, Nil>> save(
      CreateEmployeeApiDto employee, bool isNew);
}
