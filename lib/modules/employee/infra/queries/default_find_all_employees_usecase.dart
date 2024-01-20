import 'dart:async';

import 'package:voleep_carclean_frontend/core/exceptions/application_exception.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/modules/employee/application/list/find_all_employees_usecase.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/repositories/employee_repository.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/models/page_response.dart';

class DefaultFindAllEmployeesUsecase extends FindAllEmployeesUsecase {
  final EmployeeRepository repository;

  DefaultFindAllEmployeesUsecase(this.repository);

  @override
  FutureOr<Either<ApplicationException, PageResponse<Employee>>> execute(
      Query query) async {
    final result = await repository.findAll(query);

    switch (result) {
      case Success(:final value):
        {
          final data = value.pageData.map((item) => item.toAggregate());
          final page = value.copyWithData(data);
          return Success(page);
        }
      case Failure(:final exception, :final stackTrace):
        {
          final applicationException = ApplicationException(exception.message);
          return Failure(applicationException, stackTrace);
        }
    }
  }
}
