import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:voleep_carclean_frontend/modules/customer/data/repositories/customer_repository.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer_edit/customer_edit_vm.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';

import '../../../../provider_container.dart';

class MockCustomerRepository extends Mock implements CustomerRepository {}

void main() {
  late ProviderContainer container;
  late MockCustomerRepository repository;

  setUp(() {
    repository = MockCustomerRepository();
    container = createContainer(overrides: [
      customerRepositoryProvider.overrideWithValue(repository),
    ]);
  });

  group('ViewModel: Customer Edit Page', () {
    test('Should create empty Customer if ID is equals to \'new\'', () async {
      await expectLater(
        container.read(customerEditVmProvider('new').future),
        completion(
          predicate<CustomerModel>((customer) {
            expect(customer.customerId, isNotNull);
            expect(customer.dsName, isNotNull);
            expect(customer.stCustomer, DisabledEnabled.enabled);
            return true;
          }),
        ),
      );
    });
  });
}
