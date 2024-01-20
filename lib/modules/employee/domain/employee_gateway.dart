import 'dart:async';

import 'package:voleep_carclean_frontend/core/exceptions/gateway_exception.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/fp/nil.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_id.dart';

abstract class EmployeeGateway {
  Future<Either<GatewayException, Nil>> create(Employee employee);

  Future<Either<GatewayException, Employee?>> getById(EmployeeID id);
}
