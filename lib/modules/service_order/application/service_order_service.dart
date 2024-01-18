import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/exceptions/service_exception.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/modules/service_order/data/repositories/service_order_repository.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_model.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/models/page_response.dart';

part 'service_order_service.g.dart';

@riverpod
ServiceOrderService serviceOrderService(ServiceOrderServiceRef ref) {
  final repository = ref.read(serviceOrderRepositoryProvider);
  return ServiceOrderService(repository: repository);
}

class ServiceOrderService {
  final ServiceOrderRepository repository;

  ServiceOrderService({required this.repository});

  Future<Either<ServiceException, PageResponse<ServiceOrderModel>>> getPage(
      List<Filter> query) async {
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
