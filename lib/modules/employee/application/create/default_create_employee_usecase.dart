import 'dart:async';

import 'package:voleep_carclean_frontend/core/exceptions/application_exception.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/fp/nil.dart';
import 'package:voleep_carclean_frontend/modules/employee/application/create/create_employee_usecase.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/commands/create_employee_command.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/employee_gateway.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';

class DefaultCreateEmployeeUseCase extends CreateEmployeeUseCase {
  final EmployeeGateway gateway;

  DefaultCreateEmployeeUseCase(this.gateway);

  @override
  FutureOr<Either<ApplicationException, Nil>> execute(
      CreateEmployeeCommand command) async {
    final employee = Employee.create(command);
    final result = await gateway.create(employee);

    switch (result) {
      case Success(:final value):
        {
          return Success(value);
        }
      case Failure(:final exception, :final stackTrace):
        {
          final applicationException = ApplicationException(exception.message);
          return Failure(applicationException, stackTrace);
        }
    }
  }
}
