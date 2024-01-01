import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/customer/data/repositories/customer_repository.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/models/filter.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scaffold_with_list/scaffold_with_list.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_search_bar/voleep_search_bar.dart';

class CustomerListPage extends ConsumerStatefulWidget {
  const CustomerListPage({Key? key, this.selectionMode = false})
      : super(key: key);

  final bool selectionMode;

  @override
  ConsumerState<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends ConsumerState<CustomerListPage> {
  final filterVN = ValueNotifier<List<Filter>>([]);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithList<CustomerModel, String>(
      headerSliver: VoleepSearchBar(
        field: "dsName",
        filterNotifier: filterVN,
      ),
      filterNotifier: filterVN,
      selectId: (item) => item.customerId,
      onGetItem: ref.read(customerRepositoryProvider).findById,
      onGetPage: ref.read(customerRepositoryProvider).getPage,
      itemBuilder: (context, index, item) {
        return ListTile(title: Text(item.dsName));
      },
      onTab: (item, index) async {
        await context.push(Routes.app.customer.update(item.customerId));
        return true;
      },
    );
  }

  @override
  void dispose() {
    filterVN.dispose();

    super.dispose();
  }
}
