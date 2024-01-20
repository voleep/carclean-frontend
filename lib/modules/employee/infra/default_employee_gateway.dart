import 'dart:async';

import 'package:voleep_carclean_frontend/core/exceptions/gateway_exception.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/fp/nil.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/employee_gateway.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_id.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/repositories/employee_repository.dart';
import 'package:voleep_carclean_frontend/modules/employee/infra/dtos/create_employee_api_dto.dart';

class DefaultEmployeeGateway extends EmployeeGateway {
  final EmployeeRepository repository;

  DefaultEmployeeGateway(this.repository);

  @override
  Future<Either<GatewayException, Nil>> create(Employee employee) async {
    final createEmployee = CreateEmployeeApiDto.from(employee);
    final result = await repository.save(createEmployee, true);

    switch (result) {
      case Success(:final value):
        {
          return Success(value);
        }
      case Failure(:final exception, :final stackTrace):
        {
          final gatewayException = GatewayException(exception.message);
          return Failure(gatewayException, stackTrace);
        }
    }
  }

  @override
  Future<Either<GatewayException, Employee?>> getById(EmployeeID id) async {
    final result = await repository.getById(id);

    switch (result) {
      case Success(:final value):
        {
          return Success(value?.toAggregate());
        }
      case Failure(:final exception, :final stackTrace):
        {
          final gatewayException = GatewayException(exception.message);
          return Failure(gatewayException, stackTrace);
        }
    }
  }
}
