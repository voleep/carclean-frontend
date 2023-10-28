import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/customer/data/dtos/create_customer_dto.dart';
import 'package:voleep_carclean_frontend/modules/customer/data/repositories/customer_repository.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/typedefs/customer_id.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';

part 'customer_form_controller.g.dart';

@riverpod
class CustomerFormController extends _$CustomerFormController {
  @override
  FutureOr<CustomerModel?> build(CustomerId? arg, FormMode mode) async {
    if (arg == null) {
      return null;
    }

    state = const AsyncLoading();

    final getCustomerResult = await ref.read(customerRepositoryProvider).findById(customerId: arg);

    state = switch (getCustomerResult) {
      Success(:final value) => AsyncData(value),
      Failure(:final exception, :final stackTrace) => AsyncError(exception, stackTrace)
    };
  }

  Future<void> saveOrUpdateCustomer({
    required String name,
    String? telephone,
    String? email,
    String? document,
    String? notes,
    required DisabledEnabled situation,
  }) async {
    state = const AsyncValue.loading();

    final isUpdateMode = mode == FormMode.update;

    final createCustomerDTO = CreateCustomerDTO(
      idCustomer: isUpdateMode ? arg : null,
      dsName: name,
      dsTelephone: telephone,
      dsEmail: email,
      dsDocument: document,
      dsNote: notes,
      stCustomer: situation,
    );

    ref.read(isLoadingProvider.notifier).state = true;

    final saveCustomerResult = await ref.read(customerRepositoryProvider).saveOrUpdate(createCustomerDTO);

    ref.read(isLoadingProvider.notifier).state = false;

    state = switch (saveCustomerResult) {
      Success(:final value) => AsyncData(value),
      Failure(:final exception, :final stackTrace) => AsyncValue.error(exception, stackTrace)
    };
  }
}
