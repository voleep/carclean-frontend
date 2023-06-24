import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/customers/data/repositories/providers/customer_repository_provider.dart';
import 'package:voleep_carclean_frontend/modules/customers/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/customers/domain/typedefs/customer_id.dart';

class CustomerPageController extends AutoDisposeFamilyAsyncNotifier<CustomerModel?, CustomerId?> {
  @override
  FutureOr<CustomerModel?> build(CustomerId? arg) async {
    if (arg != null) {
      if (arg == "new") {
        return null;
      }

      final CustomerModel? customerModel = await ref.read(customerRepositoryProvider).findById(customerId: arg);

      return customerModel;
    }

    return null;
  }

  Future<void> saveOrUpdateCustomer({
    CustomerId? customerId,
    required String name,
    String? telephone,
    String? email,
    String? document,
    String? notes,
    required int status,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<CustomerModel?>(
      () async => await ref.read(customerRepositoryProvider).saveOrUpdate(
            customerId: customerId,
            name: name,
            telephone: telephone,
            email: email,
            document: document,
            notes: notes,
            status: status,
          ),
    );
  }
}
