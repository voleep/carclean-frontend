import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/customer/data/dtos/create_customer_dto.dart';
import 'package:voleep_carclean_frontend/modules/customer/data/repositories/customer_repository.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';

part 'customer_edit_vm.g.dart';

@riverpod
class CustomerEditVm extends _$CustomerEditVm {
  bool get isNew => id == 'new';

  @override
  FutureOr<CustomerModel> build(String id) async {
    if (isNew) {
      return CustomerModel(
        customerId: const Uuid().v1(),
        dsName: '',
        stCustomer: DisabledEnabled.enabled,
      );
    }

    final getResult = await ref.read(customerRepositoryProvider).findById(id);

    return switch (getResult) {
      Success(:final value) => value,
      Failure(:final exception) => throw exception
    };
  }

  Future<void> save({
    required String name,
    required DisabledEnabled situation,
    String? telephone,
    String? email,
    String? document,
    String? notes,
  }) async {
    ref.read(isLoadingProvider.notifier).state = true;

    final createCustomerDTO = CreateCustomerDTO(
      idCustomer: state.value?.customerId,
      dsName: name,
      dsTelephone: telephone,
      dsEmail: email,
      dsDocument: document,
      dsNote: notes,
      stCustomer: situation,
    );

    final saveResult = await ref
        .read(customerRepositoryProvider)
        .save(createCustomerDTO, isNew);

    ref.read(isLoadingProvider.notifier).state = false;

    state = switch (saveResult) {
      Success(:final value) => AsyncData(value),
      Failure(:final exception, :final stackTrace) =>
        state.mergeWith(AsyncError(exception, stackTrace))
    };
  }
}
