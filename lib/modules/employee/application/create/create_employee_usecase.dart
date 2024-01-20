import 'package:voleep_carclean_frontend/core/ddd/usecases/usecase.dart';
import 'package:voleep_carclean_frontend/core/exceptions/application_exception.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/fp/nil.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/commands/create_employee_command.dart';

abstract class CreateEmployeeUseCase
    extends UseCase<CreateEmployeeCommand, Either<ApplicationException, Nil>> {}
