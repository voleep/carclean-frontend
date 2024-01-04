import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/customer/customer_routes.dart';
import 'package:voleep_carclean_frontend/modules/customer/data/repositories/customer_repository.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_list_tile/voleep_list_tile.dart';
import 'package:voleep_carclean_frontend/routing/routes/routes.dart';
import 'package:voleep_carclean_frontend/shared/utils/list_controller.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scaffold_with_list/scaffold_with_list.dart';
import 'package:voleep_carclean_frontend/shared/enums/selection.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_search_bar/voleep_search_bar.dart';

class CustomerListPage extends ConsumerStatefulWidget {
  const CustomerListPage({Key? key, this.selection = Selection.none})
      : super(key: key);

  final Selection selection;

  @override
  ConsumerState<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends ConsumerState<CustomerListPage> {
  late final ListController<CustomerModel> listController;

  @override
  void initState() {
    super.initState();

    listController = ListController(
      selection: widget.selection,
      selectionKey: (item) => item.customerId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithList<CustomerModel>(
      headerSliver: VoleepSearchBar(
        field: "dsName",
        controller: listController,
      ),
      controller: listController,
      onGetPage: ref.read(customerRepositoryProvider).getPage,
      itemBuilder: (context, index, item) {
        return VoleepListTile(
          title: item.dsName,
          subtitle:
              "${item.dsTelephone ?? 'sem telefone'} - ${item.dsEmail ?? 'sem e-mail'}",
          item: item,
          controller: listController,
          onEdit: goToUpdate,
        );
      },
      onNew: goToNew,
      onDone: () => context.pop(listController.selected),
    );
  }

  Future<void> goToUpdate(CustomerModel item) async {
    await context.push(CustomerRoutes.edit(item.customerId));
    await listController.setFuture(
      () => ref.read(customerRepositoryProvider).findById(item.customerId),
      replacing: item,
    );
  }

  Future<void> goToNew() async {
    await context.push(Routes.app.customer.create);
    listController.notifyFilterListeners();
  }

  @override
  void dispose() {
    listController.dispose();

    super.dispose();
  }
}
