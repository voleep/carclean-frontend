import 'dart:async';

import 'package:voleep_carclean_frontend/core/exceptions/application_exception.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/modules/employee/application/get/get_employee_by_id_usecase.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/employee_gateway.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_id.dart';

class DefaultGetEmployeeByIdUsecase extends GetEmployeeByIdUseCase {
  final EmployeeGateway gateway;

  DefaultGetEmployeeByIdUsecase(this.gateway);

  @override
  FutureOr<Either<ApplicationException, Employee?>> execute(
      EmployeeID id) async {
    final result = await gateway.getById(id);

    return switch (result) {
      Success() => Success(result.value),
      Failure(:final exception, :final stackTrace) => Failure(
          ApplicationException(exception.message),
          stackTrace,
        )
    };
  }
}
