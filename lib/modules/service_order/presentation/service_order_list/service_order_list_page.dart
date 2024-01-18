import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/modules/service_order/application/service_order_service.dart';
import 'package:voleep_carclean_frontend/modules/service_order/domain/models/service_order_model.dart';
import 'package:voleep_carclean_frontend/modules/service_order/service_order_routes.dart';
import 'package:voleep_carclean_frontend/shared/utils/list_controller.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scaffold_with_list/scaffold_with_list.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_sliver_bar/voleep_sliver_bar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_sliver_search/voleep_sliver_search.dart';

class ServiceOrderListPage extends ConsumerStatefulWidget {
  const ServiceOrderListPage({super.key});

  @override
  ConsumerState<ServiceOrderListPage> createState() =>
      _ServiceOrderListPageState();
}

class _ServiceOrderListPageState extends ConsumerState<ServiceOrderListPage> {
  late final ListController<ServiceOrderModel> listController;

  @override
  void initState() {
    listController = ListController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithList<ServiceOrderModel>(
      headerSlivers: [
        const VoleepSliverBar(
          title: "Ordens de serviço",
        ),
        VoleepSliverSearch(
          field: 'customer.dsName',
          controller: listController,
        )
      ],
      controller: listController,
      onSearch: ref.read(serviceOrderServiceProvider).getPage,
      itemBuilder: (context, index, item) {
        return ListTile(title: Text(item.customer.dsName));
      },
      onNew: gotToNew,
    );
  }

  gotToNew() {
    context.push(ServiceOrderRoutes.create);
  }

  @override
  void dispose() {
    listController.dispose();

    super.dispose();
  }
}
