import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/customers/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/customers/domain/typedefs/customer_id.dart';
import 'package:voleep_carclean_frontend/modules/customers/presentation/customer-form/customer_page_controller.dart';

final customerPageControllerProvider = AutoDisposeAsyncNotifierProviderFamily<
    CustomerPageController, CustomerModel?, CustomerId?>(
  () => CustomerPageController(),
);
