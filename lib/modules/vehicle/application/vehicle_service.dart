import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/exceptions/service_exception.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/repositories/vehicle_repository.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle_model.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/models/page_response.dart';

part 'vehicle_service.g.dart';

@riverpod
VehicleService vehicleService(VehicleServiceRef ref) {
  final repository = ref.read(vehicleRepositoryProvider);
  return VehicleService(repository: repository);
}

class VehicleService {
  final VehicleRepository repository;

  VehicleService({required this.repository});

  Future<Either<ServiceException, PageResponse<VehicleModel>>> getPage(
    List<Filter> query,
  ) async {
    final pageResult = await repository.getPage(query);

    switch (pageResult) {
      case Success(value: final page):
        {
          final model = page.pageData.map((item) => item.toModel()).toList();

          return Success(page.copyWithData(model));
        }
      case Failure(:final exception, :final stackTrace):
        {
          return Failure(
            ServiceException(exception.message),
            stackTrace,
          );
        }
    }
  }
}
