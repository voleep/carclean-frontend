import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/customer/data/dtos/create_customer_dto.dart';
import 'package:voleep_carclean_frontend/modules/customer/data/repositories/providers/customer_repository_provider.dart';
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

    final CustomerModel? customerModel = await ref.read(customerRepositoryProvider).findById(customerId: arg);
    if (customerModel == null) {
      throw ErrorHint("Não foi possível localizar um cliente com ID: $arg");
    }

    return customerModel;
  }

  Future<void> saveOrUpdateCustomer({
    required String name,
    String? telephone,
    String? email,
    String? document,
    String? notes,
    required DisabledEnabled situation,
  }) async {
    state = await AsyncValue.guard<CustomerModel?>(
      () async {
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
        CustomerModel? savedCustomer = await ref.read(customerRepositoryProvider).saveOrUpdate(createCustomerDTO);
        ref.read(isLoadingProvider.notifier).state = false;

        return savedCustomer;
      },
    );
  }
}
