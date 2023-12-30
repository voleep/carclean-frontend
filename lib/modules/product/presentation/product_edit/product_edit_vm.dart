import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/product/data/models/create_product_model.dart';
import 'package:voleep_carclean_frontend/modules/product/data/repositories/product_repository.dart';
import 'package:voleep_carclean_frontend/modules/product/domain/entities/product.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';

part 'product_edit_vm.g.dart';

@riverpod
class ProductEditVm extends _$ProductEditVm {
  bool get isNew => id == 'new';

  @override
  FutureOr<Product> build(String id) async {
    if (isNew) {
      return Product(
        productId: const Uuid().v1(),
        code: 0,
        description: '',
        price: 0,
        availableStock: 0,
        pcCommission: 0,
        situation: DisabledEnabled.enabled,
      );
    }

    final getResult = await ref.read(productRepositoryProvider).findById(id);

    return switch (getResult) {
      Success(:final value) => value,
      Failure(:final exception) => throw exception
    };
  }

  Future<void> save({
    required String description,
    required double price,
    required double availableStock,
    required double pcCommission,
    required DisabledEnabled situation,
  }) async {
    final showProgress = ref.read(isLoadingProvider.notifier);
    showProgress.state = true;

    final createProductModel = CreateProductModel(
      productId: state.value?.productId,
      description: description,
      price: price,
      availableStock: availableStock,
      pcCommission: pcCommission,
      situation: situation,
    );

    final saveProductResult = await ref
        .read(productRepositoryProvider)
        .save(createProductModel, isNew);

    state = switch (saveProductResult) {
      Success(:final value) => AsyncValue.data(value),
      Failure(:final exception, :final stackTrace) =>
        state.mergeWith(AsyncError(exception, stackTrace))
    };

    showProgress.state = false;
  }
}
