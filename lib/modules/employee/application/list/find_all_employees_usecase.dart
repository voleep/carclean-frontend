import 'package:voleep_carclean_frontend/core/ddd/usecases/usecase.dart';
import 'package:voleep_carclean_frontend/core/exceptions/application_exception.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/models/page_response.dart';

abstract class FindAllEmployeesUsecase extends UseCase<Query,
    Either<ApplicationException, PageResponse<Employee>>> {}
