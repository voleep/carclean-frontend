import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/product/application/dtos/product_request_dto.dart';
import 'package:voleep_carclean_frontend/modules/product/application/services/product_service.dart';
import 'package:voleep_carclean_frontend/modules/product/domain/models/product_model.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';

part 'product_form_controller.g.dart';

@riverpod
class ProductFormController extends _$ProductFormController {
  @override
  FutureOr<ProductModel?> build(ProductId? arg, FormMode mode) async {
    if (arg != null) {
      return await ref.read(productServiceProvider).findById(arg);
    }
    return null;
  }

  Future<void> saveOrUpdate({
    required String description,
    required double price,
    required double availableStock,
    required double pcCommission,
    required int situation,
  }) async {
    final showProgress = ref.read(isLoadingProvider.notifier);
    showProgress.state = true;
    state = await AsyncValue.guard<ProductModel?>(() async {
      final productRequestDTO = ProductRequestDTO(
          productId: state.value?.productId,
          description: description,
          price: price,
          availableStock: availableStock,
          pcCommission: pcCommission,
          situation: situation);

      final service = ref.read(productServiceProvider);

      if (productRequestDTO.productId != null) {
        return await service.update(productRequestDTO);
      }

      return await service.save(productRequestDTO);
    });
    showProgress.state = false;
  }
}
