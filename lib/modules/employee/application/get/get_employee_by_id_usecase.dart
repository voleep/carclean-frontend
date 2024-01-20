import 'package:voleep_carclean_frontend/core/ddd/usecases/usecase.dart';
import 'package:voleep_carclean_frontend/core/exceptions/application_exception.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_id.dart';

abstract class GetEmployeeByIdUseCase
    extends UseCase<EmployeeID, Either<ApplicationException, Employee?>> {}
