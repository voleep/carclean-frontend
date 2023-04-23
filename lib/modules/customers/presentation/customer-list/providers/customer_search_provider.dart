import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/customers/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/shared/voleep-search/domain/models/voleep_search_family_model.dart';
import 'package:voleep_carclean_frontend/shared/voleep-search/domain/models/voleep_search_model.dart';
import 'package:voleep_carclean_frontend/shared/voleep-search/presentation/voleep_search_controller.dart';

final customerSearchProvider = AutoDisposeAsyncNotifierProviderFamily<
    VoleepSearchController<CustomerModel>,
    VoleepSearchModel<CustomerModel>,
    VoleepSearchFamilyModel>(
  () => VoleepSearchController(converter: CustomerModel.fromJson),
);
