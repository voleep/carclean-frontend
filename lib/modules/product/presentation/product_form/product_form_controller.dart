import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/product/data/models/create_product_model.dart';
import 'package:voleep_carclean_frontend/modules/product/data/repositories/product_repository.dart';
import 'package:voleep_carclean_frontend/modules/product/domain/entities/product.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';
import 'package:voleep_carclean_frontend/modules/product/domain/typedefs/product_id.dart';

part 'product_form_controller.g.dart';

@riverpod
class ProductFormController extends _$ProductFormController {
  @override
  AsyncValue<Product?> build(ProductId? arg, FormMode mode) {
    if (arg != null) {
      findById(arg);
    }

    return const AsyncValue.data(null);
  }

  Future<void> findById(ProductId productId) async {
    final getProductResult = await ref.read(productRepositoryProvider).findById(productId);

    state = switch (getProductResult) {
      Success(:final value) => AsyncValue.data(value),
      Failure(:final exception, :final stackTrace) => AsyncValue.error(exception, stackTrace)
    };
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

    final createProductModel = CreateProductModel(
      productId: state.value?.productId,
      description: description,
      price: price,
      availableStock: availableStock,
      pcCommission: pcCommission,
      situation: DisabledEnabled.values[situation],
    );

    final saveProductResult = await ref.read(productRepositoryProvider).saveOrUpdate(createProductModel);

    state = switch (saveProductResult) {
      Success(:final value) => AsyncValue.data(value),
      Failure(:final exception, :final stackTrace) => AsyncValue.error(exception, stackTrace)
    };

    showProgress.state = false;
  }
}
