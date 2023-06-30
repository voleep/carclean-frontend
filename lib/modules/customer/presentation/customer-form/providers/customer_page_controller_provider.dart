import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/typedefs/customer_id.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer-form/customer_page_controller.dart';

final customerPageControllerProvider = AutoDisposeAsyncNotifierProviderFamily<CustomerPageController, CustomerModel?, CustomerId?>(
  () => CustomerPageController(),
);
